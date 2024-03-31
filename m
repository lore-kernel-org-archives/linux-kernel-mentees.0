Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54133138E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Mar 2024 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711851589; cv=none; b=QzTSkEleBLN4Cp6NFLhqZpLm0SqcpcciNlKpaX1LaLMvApwibYpUvFCVT9YaddyHg9vplxG6YBI8v4jOCT/pvLToPM5iR9qawyw2YOtQ+SBwWyo2kbBB2mqbdjnEmnmtLMXgYHR0X0AAFNkoUgv0TZM/QP+6ZkdpiDtWtGUkog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711851589; c=relaxed/simple;
	bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=IzQJZ8v9f+OzOYqktHwliQzE6zqY2g5B6lBDI5hnx6nWayexNP9JWrFz23xZcOAXR2uBObWJuk/m5NKhUMIHJsHfqBp6ND/uHmWmcRTDZshPfxxZNxPrVyvcgulgLXAz+eldcU7Pkrd7ZbO9shAMWr9aAnlBM2oH/2lI5aDYbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd9utMl3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd9utMl3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE6D60626
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Mar 2024 02:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDt5vmwVHSQw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Mar 2024 02:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08468605C7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08468605C7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dd9utMl3
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08468605C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Mar 2024 02:19:46 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c4e05a1adaso124113b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 30 Mar 2024 19:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711851585; x=1712456385; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
        b=dd9utMl3TLEpeyuHaZwc61+s6+oQuG6QDseWn0DCuPUXfv13LXb0k8CbL88Vw8qNlV
         /jazo7nVWJBgsaGNod+l4A8ZTXDg3ypVKF6o4qfPBjxXpTxHD67psc+lsZleeg/wkMwO
         QNNc04k4SrROJRqTs1X0j2EQkSTd1N5J43gSConQokLIW74hxNieXyUhSNKkoaMVF4xu
         ljV+ISy2rVzbQ/dNcfVcEKNzALHh9ym6wopdXdve7FMD/xEcc6Wdz1D//VwZd9/p1OUX
         hJtBd89pA4n4cQrgZMW8jKwh04bWoNVcrP+Fg1UeHAXi5t9Tum04mJ/LHE6s6I989RWq
         Sc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711851585; x=1712456385;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
        b=Atky3OZ+v2WfCGZuEAJHSrLTG1FZDvYx5ctx/1OUDJCRgFsGFcVJfx/4GuXuTqd5Az
         ARd2hYRa5uUCdgVDRgsWT4U/+kO/aTJIdNmt923GfGyTV1NNHOJtjP6SI4iSEUj3ZTxl
         +oqDquoOjnLO5KEqf4+aIqxm/nLFroMwgoOO+QfC5NR3sTD/OzwqHWsZZrUYe9O/18Bz
         lGDh69fGckVPHhJyTW2Dl7BV5AJIXYH3Wv6jcmOsZ/rHC4hGePelr3PBAU5m4nv6MQUG
         tuT5VW3XqAjf0qcqjh+40SjMMPoZOTsD8d4ncriU60nfZ1XPAJp5dzUX9oVM8WvUsfwn
         0zsg==
X-Forwarded-Encrypted: i=1; AJvYcCVF86ARCaFfbeGvQQN00ehzKhYtu0rourxphIEPG/y42JzP+Pvj90GabH90VQ44ruGIp+Ev296jOEQAy9e7ysFdiFxEfrIl/fXQaFM1JsvDY7uFRq8UaQmuIeILImSU
X-Gm-Message-State: AOJu0YxeR6mzUBexLudEO6YgiUqX1qgVC3ljGSRl/z2/SK+bMWRZKvYy
	+WSQ2h9h9BBJauFSwTZVtl4G7ORIc6hhfvJFM0ty7MN2X/UcV68d
X-Google-Smtp-Source: AGHT+IGUkdXyXnx9MegUXfS8lCbdfE6rmSalJRLyGDV8JdTsSDNviU15kroqV/DfSsf9+rpBDX1OEw==
X-Received: by 2002:a05:6808:2289:b0:3c3:b99c:7b5 with SMTP id bo9-20020a056808228900b003c3b99c07b5mr7622651oib.50.1711851585482;
        Sat, 30 Mar 2024 19:19:45 -0700 (PDT)
Received: from [127.0.0.1] ([122.161.52.153])
        by smtp.gmail.com with ESMTPSA id bn2-20020a056a00324200b006eacefd8fabsm5278898pfb.64.2024.03.30.19.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 19:19:44 -0700 (PDT)
Date: Sun, 31 Mar 2024 07:49:37 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: me@wantyapps.xyz
Cc: christophe.jaillet@wanadoo.fr, frank.li@vivo.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luca.ceresoli@bootlin.com, prathubaronia2011@gmail.com,
	robh@kernel.org, shresthprasad7@gmail.com, skhan@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Message-ID: <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>
In-Reply-To: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>

Oh, that's too bad. Thanks for the heads up!

Regards,
Shresth Prasad
