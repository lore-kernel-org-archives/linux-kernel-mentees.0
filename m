Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EB224DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="fCAvg05B"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF73341B9C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 10:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF73341B9C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fCAvg05B
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHb3x7XPD1Qy
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 10:12:19 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF5A41B8C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 10:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF5A41B8C
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a011e9bf336so89027966b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1700734337; x=1701339137; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrbVCzExeu1jmL69CKkLWpl5xQODZACzz++8PqEDTow=;
        b=fCAvg05BOqlshJUPYnKm3BO+0Jg+CLOtlUdAJvGJrn4/pnaa4nqF4jS1PVa41Mz9VY
         D8IeucyquFQmIB9jijGY2DUJ4TRgbEqt8715bFJXOO+kTeuE06mwEATMAfMwT3foHBM0
         nJpHtTkR2q+khfN7HWpe6W7ltpgf5XME5avyLbChVGo+EPWZcmDRSOQLBQdAi2s1TDBf
         cHU2Gi1GbfA2sXlwtG7CoV7Ca754UcLcWJboWpmy3qV/W78o8jVX2Jn4gYbZFgzdi5GT
         lK3mlyRhwifDhIoMytkXUy77gNhvWVABnB/ikmS9DwDDUKd1M5Rw4qMYxbU+TKn2f8oj
         z1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700734337; x=1701339137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrbVCzExeu1jmL69CKkLWpl5xQODZACzz++8PqEDTow=;
        b=vQeLJ2MezebfTx9YHf7aBQHFwOSUR0CSrt1OzK/BZlTl/l/5jTSmDr+vTN7Dicaqxy
         sWYsR2Kz587HS7VvUj/Bl+O8YdwWIV+Txxc+aI6S1jlDgh1eul/BIywRizPzosdm/PLO
         Mh4O6MevtoQ48FqnnUczlX1WNxWPVI6P0l1dxpMaCoJFAIZJ0bucTSS4JG1dsg8INlah
         FO5GhyQiZuYLEaY6Qno72aGFsDC/MAvMzGPlY3phtwC4QwgtSNaKEMOakz2aEXGmcSxv
         7yxIaLs9vZjegoEYswYijX4FZHFi8PHAzaDQzZRE+0Df6h3ynPkx7vldVwABJe/E1+93
         q5pA==
X-Gm-Message-State: AOJu0Ywgdjn13GNgDH3Zr7Ld6BpGzC0bmqrCyj3QPK8apIyWJ8RwUlUa
	gsts/pNW8FxS7XI10MWNeU/ysg==
X-Google-Smtp-Source: AGHT+IHxnB/GPYZ1Xs7r1Id0QxLGCp5J6PxsMmSCDFQeIJvpgwLVa1o7mPCxK+V8oWy9MzpyMzgi2Q==
X-Received: by 2002:a17:906:290:b0:a03:d8ea:a263 with SMTP id 16-20020a170906029000b00a03d8eaa263mr3851152ejf.16.1700734336915;
        Thu, 23 Nov 2023 02:12:16 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id cf16-20020a170906b2d000b0099bd7b26639sm584833ejb.6.2023.11.23.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:12:16 -0800 (PST)
Date: Thu, 23 Nov 2023 11:12:15 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v3] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZV8lf8L8Me+T7iIW@nanopsycho>
References: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>

Thu, Nov 23, 2023 at 11:01:19AM CET, swarupkotikalapudi@gmail.com wrote:
>Add some missing(not all) attributes in devlink.yaml.
>
>Re-generate the related devlink-user.[ch] code.
>
>enum have been given name as devlink_stats(for trap stats)
>and devlink_trap_metadata_type(for trap metadata type)
>
>Test result with trap-get command:
>  $ sudo ./tools/net/ynl/cli.py \
>   --spec Documentation/netlink/specs/devlink.yaml \
>   --do trap-get --json '{"bus-name": "netdevsim", \
>                          "dev-name": "netdevsim1", \
>   "trap-name": "ttl_value_is_too_small"}' --process-unknown
> {'attr-stats': {'rx-bytes': 47918326, 'rx-dropped': 21,
>                'rx-packets': 337453},
> 'bus-name': 'netdevsim',
> 'dev-name': 'netdevsim1',
> 'trap-action': 'trap',
> 'trap-generic': True,
> 'trap-group-name': 'l3_exceptions',
> 'trap-metadata': {'metadata-type-in-port': True},
> 'trap-name': 'ttl_value_is_too_small',
> 'trap-type': 'exception'}

1. You have to maintain 24 hours between submission of one
patch/patchset:
https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html
2. You didn't address my comment to last version

