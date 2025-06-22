Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17185AD5E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750579935; cv=none; b=c7xmFONpfo+VTfxOJlOnTKNnEAOHwH+6GQYvoMpAB7BHATN0ATOmz9xe/oL+Pt4LM88DwQDbbjOzt8AXK+WhQDn3naPCshaAtcduuXPoZoopQ0TpW/4Eu0rZi+C04Ktx5sts9rgYrylQh2e4KXsaTUeGmxgMnkX7CMPoQLnT0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750579935; c=relaxed/simple;
	bh=1Nyqsom7BzEZrrFbK6mIV6zQVoAU3LFbyT+w96GCjpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OM8pd4GBSUQfMzBPyT2XDcXOCy9CScoZ1GnLGlxxUMXfjv3JrZeTYvlRGKY9BeuYrVtnQLHLagmWc3o32t3vXN3d+zcU5QPR+r2BYvLvPIWNlDtdEE3+rQZ2KyX9HCzYp8Gxv5S2eYOmx6TczNMQfUx0FOqBmxfPJF4bWeQrraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+i6IZD5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+i6IZD5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74264d1832eso4123594b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750579933; x=1751184733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EBR+XoEZ32orRCDnBc/jEQaZSm0kBODP8RwLrnmBm0s=;
        b=K+i6IZD5D6VFn405+1KUVOugmqLe/KCtgnQ7+JiHf77M3B1rQWJUsIqE1Hwfbd71eU
         afpxlr5gHCg4W6Ql3/BBsg4tByMLNfv4MCCqIXiAlzViyuTgfQPnH5O4T3CAxTheZ9cN
         XkjoRSzpgeiTMIoFCxxJP98siptAvJ9xPUAOxaKMxjBfiVM8DQN9247rrYlZZepX95o8
         GgHcw5iF2bdmvsrdPbgEOWpwqi8RwaaQAR9p1hk5ixXTUSXbjQJaKPWJ2N8sa2pkgVn6
         yTdVcXYkzPDkXhvdpAk0J2Z6O6e0e9bl4Exy63ICUrBUqXX+WG2rH64TF3z4ADhNbUTG
         mSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750579933; x=1751184733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBR+XoEZ32orRCDnBc/jEQaZSm0kBODP8RwLrnmBm0s=;
        b=ePrf7T9tEiJvmuUXShjobwi003soUVfmGluagi8QMHMvrP14ti47VBXHAXGXozwSZF
         z9lMqyzRDOX7OhO1Cbn1aJoGoKH5XKv7AqVtd+4ha8LvYAci6H95emxMlu+IgsHXBz7b
         1OA8bdrMlQvtAmkDIZAY9RyYwJ1mQHkFHb+uRlfNCBcZ//WF2aTG0DXSuambh0zqV0J2
         rtDkZ4YEbxXHqAPXXOjgQY6T72b+5Gebkdgb98/500iFjfFkqKVQt7Zfk17UZ7HHlbLZ
         nb6EsbIxbEZbTq3xVtX4KqVE5FZMzUma81uwzxbzGMhMNLbCImELk8Ju9unkuThFPtcg
         xa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1LZ6DDxOHCnq8BoR4qXbnukCZWAAFjgJq9ut7awROj4BMyd7DRjJN6UHUPm+fJwZHKnBd6AQHbyq7A3AdSulkqpqv3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVnV0QqhR3YXJbClyj5ntSzIt8g20r/bX67wjKcMr5U8CBAa9w
	Dz8j0X21fWzShAXa1KDpeNPeAwbSQSujjgpJz+LYn3sGe153adWMmrju
X-Gm-Gg: ASbGncuE8oAFRjHoZ46G5VtEqSXEf5Gn1HinIHUffpJKdSbeBbRQxP2znOz7yodZeed
	WXiwvpPSSsSo0bJkx7FsZ1zz5Tadt7dxHZ11/KrzZdyrcfdxZy1MNjnj4a1RLiFJyss4cVHnR6m
	c1AAXGhIlTlxvaPBctT9QPq+YPoSNw62YN/Ug+MzoGPdiMQ5aPt3P8FT+FynLyqp8APhturMJUm
	jy2jx19uIfLIud6DcFgFUxp+WNbnuZokOBaEi945iVjVqiuckJU1TMNnsiIS81xWQ6BR+9Ry7H4
	5mjQiYqayJ1VbJ0Lbpy/RSb2OOiPn5QoUTf2icMlSnws0SPBcW1IYhUimlhYYw==
X-Google-Smtp-Source: AGHT+IGPw6YyGIuDPSt2iRzF0W7Kh+gQvIPV8hducKJ1Zi5ziOV8ujfgRDVNiq/Vn+KNi9yCX27yVA==
X-Received: by 2002:a05:6a00:14c3:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-7490d6793f7mr12661656b3a.19.1750579933256;
        Sun, 22 Jun 2025 01:12:13 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a48a1b6sm5871067b3a.50.2025.06.22.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:12:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8B4D84208F51; Sun, 22 Jun 2025 15:12:09 +0700 (WIB)
Date: Sun, 22 Jun 2025 15:12:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, pabeni@redhat.com
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	skhan@linuxfoundation.com, jacob.e.keller@intel.com,
	alok.a.tiwari@oracle.com
Subject: Re: [PATCH net-next v4] docs: net: sysctl documentation cleanup
Message-ID: <aFe62dzYPLktxZrH@archie.me>
References: <20250622062724.180130-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622062724.180130-1-abdelrahmanfekry375@gmail.com>

On Sun, Jun 22, 2025 at 09:27:24AM +0300, Abdelrahman Fekry wrote:
> @@ -1028,13 +1134,15 @@ tcp_shrink_window - BOOLEAN
>  	window can be offered, and that TCP implementations MUST ensure
>  	that they handle a shrinking window, as specified in RFC 1122.
>  
> -	- 0 - Disabled.	The window is never shrunk.
> -	- 1 - Enabled.	The window is shrunk when necessary to remain within
> +	Possible values:
> +
> +	- 0 (disabled)	The window is never shrunk.
> +	- 1 (enabled)	The window is shrunk when necessary to remain within
>  			the memory limit set by autotuning (sk_rcvbuf).
>  			This only occurs if a non-zero receive window
>  			scaling factor is also in effect.

The indentation for enabled option outputted like a definition list,
so I fix it up:

---- >8 ----
diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 682428b8f20507..e20cef49adf75c 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1136,11 +1136,10 @@ tcp_shrink_window - BOOLEAN

 	Possible values:

-	- 0 (disabled)	The window is never shrunk.
-	- 1 (enabled)	The window is shrunk when necessary to remain within
-			the memory limit set by autotuning (sk_rcvbuf).
-			This only occurs if a non-zero receive window
-			scaling factor is also in effect.
+	- 0 (disabled) - The window is never shrunk.
+	- 1 (enabled) - The window is shrunk when necessary to remain within
+	  the memory limit set by autotuning (sk_rcvbuf). This only occurs if
+	  a non-zero receive window scaling factor is also in effect.

 	Default: 0 (disabled)

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
