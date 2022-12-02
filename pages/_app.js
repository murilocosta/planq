import React from 'react';
import PropTypes from 'prop-types';
import { CacheProvider } from '@emotion/react';
import { AppShell, MantineProvider } from '@mantine/core';

import AppHeader from '../components/AppHeader';
import AppNavigation from '../components/AppNavigation';
import createEmotionCache from '../styles/theme/createEmotionCache';
import '../styles/globals.css';

const clientSideEmotionCache = createEmotionCache();

const MyApp = (props) => {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props;

  return (
    <CacheProvider value={emotionCache}>
      <MantineProvider
        withGlobalStyles
        withNormalizeCSS
        theme={{ colorScheme: 'light' }}
      >
        <AppShell
          padding='md'
          header={<AppHeader />}
          navbar={<AppNavigation />}
        >
          <Component {...pageProps} />
        </AppShell>
      </MantineProvider>
    </CacheProvider>
  );
};

MyApp.propTypes = {
  Component: PropTypes.elementType.isRequired,
  emotionCache: PropTypes.object,
  pageProps: PropTypes.object.isRequired,
};

export default MyApp;
