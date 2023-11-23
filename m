Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512B241F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="rMwOvEqB"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA9FF4023F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA9FF4023F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=rMwOvEqB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rq2-G9DS05pf
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 12:59:20 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8D84013D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8D84013D
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9e1021dbd28so105961366b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1700744358; x=1701349158; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3lEDfMbf4/5n8hKchOxqlgfXgkFHsFTDF69zq4AYLI=;
        b=rMwOvEqBMVgw5vb4Zo75xi2nDkjUdewI7FOQMOeGrK9Fm2MjFEaO9JFskCvjh415+j
         GtYcnn4JmDGUzEkMDP026X2neiwB3VgTnDNEo5QXYs0PUUSUJ+4NpltlUDOiO4L/l46x
         zEJz9d3ykgBfleorvtsPnV3hqGWaHbPDT8NcB1U+hNpo7YONEOkJ/nk/+NYel36CfiOQ
         HhNGdCHqZlZYOg9MmqlZ2H+z0d7j1AH00Hb0fhWi9Sz3V5YaccmS/ODQIUkL0B1qsiuz
         lM2wZEg3Hux/Ce4ot9mOM+g4Pm48O2CGl//hjFAR50MWdAw6VY2872EQuHt5I/0Y8bYS
         wz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700744358; x=1701349158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3lEDfMbf4/5n8hKchOxqlgfXgkFHsFTDF69zq4AYLI=;
        b=hN+aR2x9j0AlDV6eTBUngQGUrsslGOxoOnRi7OYozQlMPOE8cHIA4epVWqYgs0V1jO
         jpp3ngRMVx3I8teMa7KgRXoxIxMOkW6pwtWHuIuc3D4bw0yVvPTCsRrdWLxpBgcgGy3U
         VCO7A6oQkZSKF6Py6Bd0FfuzCNXjTMiVEFTwtOJ9/m6WTcOOAdakRtdMgngV4fk8jTyN
         djN2B41tZdh3DRtCH7TSFsl7BL7EnHPX4zzUIezWbcbRt2mvCaBKnrW+af04HO1fPGsp
         CvfSSB9Zkc9ZG1CQhOYluz8MspddtppvQH8kbVTuPsKayGrAln9/oBqQyW/LVTOQe3fP
         +gag==
X-Gm-Message-State: AOJu0Yzuo6UzpfkzFlBGsMTyMnfchtrlu0b8vsn7SSxlt34pKF9zZe/t
	/d7wMSOGEZX/H7Fgm9FOP/OaQw==
X-Google-Smtp-Source: AGHT+IEbbo+OCSVPb1MOZP7avY+hyd5lsGE7mpvnDA3Rh4qtJkO8g2wvOdUN7rUznRa1G2yr+69jZA==
X-Received: by 2002:a17:906:6958:b0:a03:cde5:e02f with SMTP id c24-20020a170906695800b00a03cde5e02fmr4192652ejs.38.1700744357954;
        Thu, 23 Nov 2023 04:59:17 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906348100b009de3641d538sm747565ejb.134.2023.11.23.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:59:17 -0800 (PST)
Date: Thu, 23 Nov 2023 13:59:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: swarup <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v3] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZV9MpLBwS1ndszzf@nanopsycho>
References: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>
 <ZV8lf8L8Me+T7iIW@nanopsycho>
 <ZV9FnjRH6VTwWaaX@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV9FnjRH6VTwWaaX@swarup-virtual-machine>

Thu, Nov 23, 2023 at 01:29:18PM CET, swarupkotikalapudi@gmail.com wrote:
>On Thu, Nov 23, 2023 at 11:12:15AM +0100, Jiri Pirko wrote:
>> Thu, Nov 23, 2023 at 11:01:19AM CET, swarupkotikalapudi@gmail.com wrote:
>> >Add some missing(not all) attributes in devlink.yaml.
>> >
>> >Re-generate the related devlink-user.[ch] code.
>> >
>> >enum have been given name as devlink_stats(for trap stats)
>> >and devlink_trap_metadata_type(for trap metadata type)
>> >
>> >Test result with trap-get command:
>> >  $ sudo ./tools/net/ynl/cli.py \
>> >   --spec Documentation/netlink/specs/devlink.yaml \
>> >   --do trap-get --json '{"bus-name": "netdevsim", \
>> >                          "dev-name": "netdevsim1", \
>> >   "trap-name": "ttl_value_is_too_small"}' --process-unknown
>> > {'attr-stats': {'rx-bytes': 47918326, 'rx-dropped': 21,
>> >                'rx-packets': 337453},
>> > 'bus-name': 'netdevsim',
>> > 'dev-name': 'netdevsim1',
>> > 'trap-action': 'trap',
>> > 'trap-generic': True,
>> > 'trap-group-name': 'l3_exceptions',
>> > 'trap-metadata': {'metadata-type-in-port': True},
>> > 'trap-name': 'ttl_value_is_too_small',
>> > 'trap-type': 'exception'}
>> 
>> 1. You have to maintain 24 hours between submission of one
>> patch/patchset:
>> https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html
>> 2. You didn't address my comment to last version
>> 
>Hi Jiri,
>
>I have read the above link, but missed the constraint
>of 24 hour gap between patches.
>I will be careful and not send the patch again within 24 hours.
>
>I could not understand your 2nd point.
>Does it mean i should not include
>test result e.g. "Test result with trap-get command: ...."

Does not make sense to me. If you put it like this, it implicates that
the trap attributes are the ones you are introducing in this patch.
However, you introduce much more.


>Or
>If it is something else, please elabroate more, which helps me to address your comment.
>
>I will try to clarify review comment, henceforth before sending new patchset for review.
>
>Thanks,
>Swarup
