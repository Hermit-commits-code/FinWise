import {Button, Text, View} from 'react-native';

import React from 'react';

const HomeScreen = ({navigation}) => {
  return (
    <View>
      <Text>Welcome to FinWise</Text>
      <Button
        title="Get Started"
        onPress={() => navigation.navigate('AnotherScreen')} // Placeholder for navigation
      />
    </View>
  );
};

export default HomeScreen;
