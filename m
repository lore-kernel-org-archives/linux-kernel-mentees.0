Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353B4A98C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="di9T1HVL"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8135841FD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8135841FD7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=di9T1HVL
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyGBH2Sq6F6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 18:15:25 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ACEC441FC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEC441FC6
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a00ac0101d9so155616466b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1700763322; x=1701368122; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTg9/NNZBMLZtAkv1MI2zSvlUaZGK/O1RTlt+dC1O7k=;
        b=di9T1HVL4K6cFkF4nBaIi18pwtMARqrmBIO/AYUeJCKG+ZFXUuyPdhxX0nGwQcRmg5
         J0yCI7wJhuWuM8yRtg/OanS63oUwQsjii/v5X3xekWSA9COhd7fXnX4fIfZGqqSqcNvz
         d/alxegte9RvmlxzgIS7nptFwwoZY3rsJFDgreG2FRkRuv+KtwsRNeyq8XgHZFYJVLQS
         Z1n3FqnE0BjxTbaidnw5md351Tc7vqHBUahjiBCirU6CQ5TsXgtjBBjJVjqf1v+yIpbC
         eAi0PqRmuwy1Ka+Iu6S7/Y4Uc6HGAIdxGeMYu2n+FmWN52X3gcWfYMNoLvoF6BrtgwNy
         U2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700763322; x=1701368122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTg9/NNZBMLZtAkv1MI2zSvlUaZGK/O1RTlt+dC1O7k=;
        b=Pj53ZP593ItyCM34+K666GWkkZBeZyTrAvPeakvg+2UfWm2xZEk1ILpyHY+pG6JIhC
         +86ubYfuWvfwDJphY5AipFgtzB3LOSAy0ivdRAWJW8F4HHW4jxTLFftd+V9/PebtQInc
         PrEixkQD/Sl/zvLfQsuPMIXQ6LKPUUDNCzoezeVjQK+uiyB3CeeUKQDNQZj7aLVJDNoi
         AQW19KeNooc2b0/pyjoazPy+/N2xcaqTnTwwcXhh58hsAmgPvhEgUHHD8QyDob78AzUs
         G4AxjyOlWPiHKPxTMgmmqRmo9prrwV6Kjk77J/C8mxUJlVMmmzRBbQ3H1AWV905AgSjI
         SpEg==
X-Gm-Message-State: AOJu0YzS4omONgprU2LKlfcbM+uhM59gefkpeh9PP31QeTXVzBXdHdPZ
	WjtSSbSOEsH8XeUz+lqnUJ4rMw==
X-Google-Smtp-Source: AGHT+IFhTRcigICH4DZrP5h/NtNQIkWD66iM2JYoZPmL7PNXFy0ysaEr+1AtehXHTiPeYDa1SDf2+w==
X-Received: by 2002:a17:906:ae8c:b0:9fc:9a03:cc23 with SMTP id md12-20020a170906ae8c00b009fc9a03cc23mr86898ejb.21.1700763322253;
        Thu, 23 Nov 2023 10:15:22 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906560400b009fcb5fcfbe6sm1057278ejq.220.2023.11.23.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:15:21 -0800 (PST)
Date: Thu, 23 Nov 2023 19:15:20 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: swarup <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v3] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZV+WuPT9f5pDiHft@nanopsycho>
References: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>
 <ZV8lf8L8Me+T7iIW@nanopsycho>
 <ZV9FnjRH6VTwWaaX@swarup-virtual-machine>
 <ZV9MpLBwS1ndszzf@nanopsycho>
 <ZV+UDY0B8AEkdVxc@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV+UDY0B8AEkdVxc@swarup-virtual-machine>

Thu, Nov 23, 2023 at 07:03:57PM CET, swarupkotikalapudi@gmail.com wrote:
>On Thu, Nov 23, 2023 at 01:59:16PM +0100, Jiri Pirko wrote:
>> Thu, Nov 23, 2023 at 01:29:18PM CET, swarupkotikalapudi@gmail.com wrote:
>> >On Thu, Nov 23, 2023 at 11:12:15AM +0100, Jiri Pirko wrote:
>> >> Thu, Nov 23, 2023 at 11:01:19AM CET, swarupkotikalapudi@gmail.com wrote:
>> >> >Add some missing(not all) attributes in devlink.yaml.
>> >> >
>> >> >Re-generate the related devlink-user.[ch] code.
>> >> >
>> >> >enum have been given name as devlink_stats(for trap stats)
>> >> >and devlink_trap_metadata_type(for trap metadata type)
>> >> >
>> >> >Test result with trap-get command:
>> >> >  $ sudo ./tools/net/ynl/cli.py \
>> >> >   --spec Documentation/netlink/specs/devlink.yaml \
>> >> >   --do trap-get --json '{"bus-name": "netdevsim", \
>> >> >                          "dev-name": "netdevsim1", \
>> >> >   "trap-name": "ttl_value_is_too_small"}' --process-unknown
>> >> > {'attr-stats': {'rx-bytes': 47918326, 'rx-dropped': 21,
>> >> >                'rx-packets': 337453},
>> >> > 'bus-name': 'netdevsim',
>> >> > 'dev-name': 'netdevsim1',
>> >> > 'trap-action': 'trap',
>> >> > 'trap-generic': True,
>> >> > 'trap-group-name': 'l3_exceptions',
>> >> > 'trap-metadata': {'metadata-type-in-port': True},
>> >> > 'trap-name': 'ttl_value_is_too_small',
>> >> > 'trap-type': 'exception'}
>> >> 
>> >> 1. You have to maintain 24 hours between submission of one
>> >> patch/patchset:
>> >> https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html
>> >> 2. You didn't address my comment to last version
>> >> 
>> >Hi Jiri,
>> >
>> >I have read the above link, but missed the constraint
>> >of 24 hour gap between patches.
>> >I will be careful and not send the patch again within 24 hours.
>> >
>> >I could not understand your 2nd point.
>> >Does it mean i should not include
>> >test result e.g. "Test result with trap-get command: ...."
>> 
>> Does not make sense to me. If you put it like this, it implicates that
>> the trap attributes are the ones you are introducing in this patch.
>> However, you introduce much more.
>> 
>> 
>> >Or
>> >If it is something else, please elabroate more, which helps me to address your comment.
>> >
>> >I will try to clarify review comment, henceforth before sending new patchset for review.
>> >
>> >Thanks,
>> >Swarup
>
>Hi Jiri,
>
>I will submit a patch which has only trap attribute only changed.
>
>Thanks for the clarification.

Better to just remove the "test result" from the description.


>
>Thanks,
>Swarup
