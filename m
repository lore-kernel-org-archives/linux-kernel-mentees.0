Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391BED6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYWyHpW3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 019C0613F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019C0613F5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jYWyHpW3
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7mQmVKr-ok5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 11 Jan 2024 01:20:47 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F3BC3613D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3BC3613D7
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d3e05abcaeso32226615ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jan 2024 17:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704936046; x=1705540846; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+85vjAWnmuAqmINzQfl2QzJ3u0NEMnxOJaGB/D0sB4=;
        b=jYWyHpW3PBwrcXvKp0tDa1dqJ+0Dxs70OJn30y5JR8YGIl2qlIdQnkz7L16b4ZS4As
         B8BepuwDTi64Y7ePLtKtco52DACIY5bOSbSuF68HrmqgUxV46yyac2bt6MBcnzTBzcKO
         tNkE+eWebysNjeSFRMLRoD/qxzM+8uHK4aYspizKiu11AMrxB0S8KA1zYcvxCdpgrqh5
         noKBEp0HML3ThcwIoSsqUsBvGiVOpCWRUezvwtAAGDhs+DnHZMqdTPPk0o7UdlBm9h24
         zSGzXpH0JBIYonaq1L+pFLBAdatXc0aqkQkSu2u9avVyRxdn6hgb15z5Rxn0+i9UiTRx
         MUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704936046; x=1705540846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+85vjAWnmuAqmINzQfl2QzJ3u0NEMnxOJaGB/D0sB4=;
        b=FsdBDbEDXgQuheCjfGfz1AIepYeYtczh24nLLi8x92RXXgLnG2ZPYw68aKiO6y9yEA
         R0GXKm1YF4r1vBAyNsXO/OvDSOwII4rdOfPnuYLvI1zy2LX5cq/xCOyFT1VKdGkmSVni
         vFIbgXUjQHsXE4ls12cd5CMNgMCGawMWpzc8nS7vWbDWYLXHKtZUKRgoQ0jsjdhuE8mf
         0K5RKkRJBgtS9Y24IJI1a+uj9aUBAtc4HLRUR1TLOkjeAhoxB2n69Rp3+jQSxmrt1i8y
         GBb69QB+GAOyMimuiMAXMjpP6oEPKmTtVvdba8vybzOSnvwyB7vQbF2ZMl51nLoiRnc5
         bISA==
X-Gm-Message-State: AOJu0YyeuWQaxduLPvJ+gNFY/VZm++XOM54dyc0mCkYV6kSJ98QXD2or
	5jv3Xvx1HdkHd/j3nRmzsF0=
X-Google-Smtp-Source: AGHT+IHDtY/zHkCm0BIQ5AWUy1WbvTxZ/YQnd12fJR9h98cktHmfmoALSkLqP6i+09l7fOkogTzgeQ==
X-Received: by 2002:a17:902:9a05:b0:1d4:cdc9:6c1e with SMTP id v5-20020a1709029a0500b001d4cdc96c1emr336684plp.109.1704936046045;
        Wed, 10 Jan 2024 17:20:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:70e2:a0a5:5166:fbbf])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902820900b001d4cad5bcf0sm4249726pln.237.2024.01.10.17.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 17:20:45 -0800 (PST)
Date: Wed, 10 Jan 2024 17:20:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v12 2/2] input: joystick: driver for Adafruit Seesaw
 Gamepad
Message-ID: <ZZ9CaiYCqDlSxiIb@google.com>
References: <20240106015111.882325-1-anshulusr@gmail.com>
 <20240106015111.882325-2-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106015111.882325-2-anshulusr@gmail.com>

Hi Anshul,

On Sat, Jan 06, 2024 at 07:21:00AM +0530, Anshul Dalal wrote:
> +
> +	for_each_set_bit(i, (long *)&SEESAW_BUTTON_MASK,
> +			 BITS_PER_TYPE(SEESAW_BUTTON_MASK)) {

This is not really safe as it might not be aligned properly, and we can
potentially try to peek beyond the data element (even though we limit
how many bits we consider valid). I changed SEESAW_BUTTON_MASK to be
unsigned long.

I also dropped bunch of unneeded casts and applied, thank you.

Thanks.

-- 
Dmitry
