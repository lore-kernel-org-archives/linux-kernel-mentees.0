Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ABF1CF98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="BRsznJMz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33265405CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33265405CF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BRsznJMz
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCvX8nO2EWEx
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 11:44:14 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02EEC405AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02EEC405AA
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso6739424a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1699875852; x=1700480652; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XO1O0WOtFWLcsgZyKH11Gnde4LKr23U0MkMP6pi0iUw=;
        b=BRsznJMzopzvzCTgNKb5T2xk3ZW5aMVOE57fy0KK7MstouWu6d5ARyqwWpctH5LDqp
         l1Dm5dJh3x89C+sFitIcnQv8meg4Q5ep0OX1UA4SREaLiNcuWC0wwti73e5AFEkOGhJZ
         wGIPB9tHL3ZsT6HUZuXkD8QhBUdqrykv1srDQVNkW7dg5Vcm9mUs81aYac1vQh/5kFQM
         aGgINmKD/wpis1vKuAPNAXZbw9vuf+AXW0rahsQ1LCnLKSuktZFdIXEmH7wuZ+pQH0AQ
         tNN7kzkUu6LKOEhBJR/UKXJGzA/1M3e437palkFrCR4bPJpocUQhYWA5fljS1ObwFf9l
         0WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699875852; x=1700480652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO1O0WOtFWLcsgZyKH11Gnde4LKr23U0MkMP6pi0iUw=;
        b=a3vLlWW4w+XiZB5Y3dx4Fc0FyvudD4683/nHuiyh0y3wZKg2aPNpl8tr4N5gVmVa/b
         slrVQ+5FjYS4w7kg4//l+vanBu1o/N78sRMk3Nh9NMpipE0UFTk9y5sM6hW5UAJCK/SN
         7szAf3zO1RQs4prKAEokmXxeOMnWguy18jZTaR0EXyayrN8Stz4jj9fta9kujQsnlLyB
         LLLJjsvvqScDziYb/nbdB5Q5lNLzoL2VpvKa/q7ZdJSHtLl/EiOfQEdiw0JIB8J6ZfZC
         mQ3AzTViHDv7KZTW5ESfcejqz1Xj/uMExPIAbEFNjxoUHM0FxTQQC7j3YABsbS9hqb3j
         Dnuw==
X-Gm-Message-State: AOJu0YxrB6grKy0anmEAuXhkuEa0rQB3JC1y9vuZozjRtxTrkvI0Hp/D
	8LBNyb7c2rQexgfsJaGX8rs9QQ==
X-Google-Smtp-Source: AGHT+IE+3lRRXjlbYq3+2L4rFUs/RW0wOkeatCRsXh1zkBtCsKZJ3Go9hSq8QXrgpljeADZQEobMbw==
X-Received: by 2002:a17:906:4a12:b0:9e3:675f:e36b with SMTP id w18-20020a1709064a1200b009e3675fe36bmr4934627eju.59.1699875852127;
        Mon, 13 Nov 2023 03:44:12 -0800 (PST)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id lg20-20020a170906f89400b009e5c644e34dsm3893391ejb.82.2023.11.13.03.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:44:11 -0800 (PST)
Date: Mon, 13 Nov 2023 12:44:10 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] netlink: specs: devlink: add missing attributes in
 devlink.yaml and re-generate the related code
Message-ID: <ZVIMCnimkdpyi5IY@nanopsycho>
References: <20231112092352.20072-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112092352.20072-1-swarupkotikalapudi@gmail.com>

Sun, Nov 12, 2023 at 10:23:52AM CET, swarupkotikalapudi@gmail.com wrote:
>Add missing attributes in devlink.yaml.
>
>Re-generate the related devlink-user.[ch] code.
>
>trap-get command prints nested attributes.
>
>Test result with trap-get command:

trap is just an example of command that din't have all attrs defines.
But there are many others. Adjust your patch description accordingly
please. Now it looks like this is about trap only.


>
>sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/devlink.yaml
>--do trap-get --json '{"bus-name": "netdevsim", "dev-name": "netdevsim1",
>"trap-name": "ttl_value_is_too_small"}' --process-unknown
>
>{'attr-stats': {'rx-bytes': 30931292, 'rx-dropped': 87,
> 'rx-packets': 217826},
> 'bus-name': 'netdevsim',
> 'dev-name': 'netdevsim1',
> 'trap-action': 'trap',
> 'trap-generic': True,
> 'trap-group-name': 'l3_exceptions',
> 'trap-metadata': {'metadata-type-in-port': True},
> 'trap-name': 'ttl_value_is_too_small',
> 'trap-type': 'exception'}
>
>Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
>Suggested-by: Jiri Pirko <jiri@resnulli.us>

[..]
