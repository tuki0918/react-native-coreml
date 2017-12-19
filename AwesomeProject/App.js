/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    Image,
    Platform,
    StyleSheet,
    Text,
    View,
    NativeModules
} from 'react-native';

const RNCoreML = NativeModules.RNCoreML;

const instructions = Platform.select({
    ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
    android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

export default class App extends Component<{}> {

    state = {
        imageURL: 'https://cdn-ak2.f.st-hatena.com/images/fotolife/t/tuki0918/20171219/20171219221435.jpg',
        identifier: '-',
        confidence: 0
    };

    componentDidMount() {
        this.predict();
    }

    /**
     * 画像の分類予測
     */
    predict = () => {
        const { imageURL } = this.state;
        RNCoreML.predict(imageURL).then(data => {
            this.setState({
                identifier: data.identifier,
                confidence: data.confidence
            });
        });
    };

    render() {

        const { imageURL, identifier, confidence } = this.state;

        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    Welcome to React Native!
                </Text>
                <Image style={{width: 150, height: 150}} source={{uri: imageURL}} />
                <Text style={styles.instructions}>
                    identifier: {identifier}
                </Text>
                <Text style={styles.instructions}>
                    confidence: {confidence}
                </Text>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginTop: 5,
    },
});
