Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF8182B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="H5rLv/l1"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD3560BAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 07:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD3560BAA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=H5rLv/l1
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfmaeUEddaAQ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Dec 2023 07:51:59 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74EB360B65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 07:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74EB360B65
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a195a1474easo43812566b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Dec 2023 23:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1701849117; x=1702453917; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eFp5uRjObHI5sx2KkKwRQYb2OVirn1mK3AeigSWlk4s=;
        b=H5rLv/l1x2gSjGiD25O/iClp5LTzDEgbzX5Mv2frTQV1pkiCLVzersyOi20f7O/0i8
         bcMRY2wF9tYARH7sNnuS2It2sr2UjWK5T1mcXMh29V8L+MWcsvzgBcT+eF23260oqAQH
         hCS5vjR5+MJkQ/Nsi3i+MTUG8mCEL8e0Tyoq3J1NudiLBwSkrV2QIMDCll18pP/QHTDH
         NLN3o+fSMvfjzaywouGR4gP1Bd1RmbOcySup9LFNOaZ4sJrj+D4rdcD4AmLuVYAB5om+
         CE8lfxW8CeT2tvaAVB6dANmSxa6qJzK5QMksrXr0JNN+hrxB17RM+MXnSNEE2Fcq5N1e
         /oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701849117; x=1702453917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFp5uRjObHI5sx2KkKwRQYb2OVirn1mK3AeigSWlk4s=;
        b=RoveeC1sqk0h6ObBcqCSOuGEzrYqgNxdF5u5IGZXh7rspszu9SGNTJl9bl0drbxcdp
         ZpCIUo3mnWUAd9jm/SOv8UKTapGE3tlRWCrZSg7+mRkwHoJw1fAhZt5lGfr/rPSMs7je
         SLcKUpoEH215wbtnF4oP+jUiAEp4JFc5uPvyc4iU23g/YT/FRtTOUP91xyUcDuDrNFzj
         28n5+txQyVHF0qhf/mbECSjgPCdCcWGhrbrQUGAJCt5LBkNXq28DVz8/vqcR++8rHDYu
         EXKalyonWyOIGjorkidtdVgsyHGLduzEe+htnASBxTlGEVL5jpIhODIVPGu0NuL/vn++
         tV+Q==
X-Gm-Message-State: AOJu0YwbMiNLUxnomJVsYizAYY2EhaznnUP4ZcBv8EwKx2x4olUF/aZi
	Ugo5HiJMhrLsZowceieIHC5XrQ==
X-Google-Smtp-Source: AGHT+IHMzuY1meGvg3Pi+vDkWvago2/oB4Ztcse2n8A7UWRnbPN+dQ+ogzUsnIcWjEorXoxs4+bAgA==
X-Received: by 2002:a17:906:1cd:b0:a02:9891:29ba with SMTP id 13-20020a17090601cd00b00a02989129bamr269843ejj.15.1701849116698;
        Tue, 05 Dec 2023 23:51:56 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709064c8e00b009fc42f37970sm7915855eju.171.2023.12.05.23.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 23:51:56 -0800 (PST)
Date: Wed, 6 Dec 2023 08:51:54 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXAoGhUnBFzQxD0f@nanopsycho>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
 <20231205191944.6738deb7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205191944.6738deb7@kernel.org>

Wed, Dec 06, 2023 at 04:19:44AM CET, kuba@kernel.org wrote:
>On Sat,  2 Dec 2023 18:00:48 +0530 Swarup Laxman Kotiaklapudi wrote:
>> Add some missing(not all) attributes in devlink.yaml.
>
>Hi Jiri,
>
>Do you want to take a closer look at the spec here?
>Looks fine to me, on a quick scroll.

Yep, will do that later today.

>
>> Suggested-by: Jiri Pirko <jiri@resnulli.us>
>> Suggested-by: Jakub Kicinski <kuba@kernel.org>
>> Fixes: f2f9dd164db0 ("netlink: specs: devlink: add the remaining command to generate complete split_ops")
>
>I'll drop these when / if applying, FWIW. 
>
>Swarup, for future reference if there are comments / changes suggested
>during normal review process you don't have to add the Suggested-by

My "suggested-by" is probably fine as I suggested Swarup to make the patch :)


>tag. The expectation is that the reviewer will send a Reviewed-by tag
>themselves at the end instead.
