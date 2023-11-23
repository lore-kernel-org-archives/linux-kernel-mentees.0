Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BF4B5B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN0je9TA"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D432141633
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D432141633
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VN0je9TA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYyK9VUrA3up
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 18:04:03 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 883E840519
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 18:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 883E840519
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so792396a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 10:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700762643; x=1701367443; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stx+9AzS1hxNweTdFlkIrchUwRIllZD+BwM1bokQ+ic=;
        b=VN0je9TAz2WqiK6oCjO7Hs0V0O1MW/BX7fpUae3U+Qc8RsfKIkzzIavi5zf50pDPSl
         5MABd9DWne6JlL9nGaKXLjdKNmkVFqWVv3v4O08PVYT83ZLrp/DE7TnRELO887gkhwZr
         +mc3hwphltrbYN5fGcsLdvz1OiaUzkghPcDWNdi4WuV99rkYEHp7VejDvNNFwG/a4QKf
         7VbttJBqyvpJNuWRPeqWBx/L0hvxYGFkZK3s10X38joKYWrP//QmFo7q2yZB9blVCLuy
         hN4GlNk1pNpxSPGlGRZET6NQXvYcIlg3jNRa3z75dxwAPz0Qy/7K1fIAp5Z5JGEvGUW7
         oUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762643; x=1701367443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stx+9AzS1hxNweTdFlkIrchUwRIllZD+BwM1bokQ+ic=;
        b=Yt9e5w4/hZaAINImWeteUh4S2woe45mfARr3OvAT8UjFKwFBqrdt9N26aUfC3w0fBj
         xPjc8vP6nkgtL6GHTalPuTdiMwwmK6NxKOSQDRQ0ctjPfm4XSaI9Yntre4yvC4Op057R
         tOVrN9Q5xaq+zTDbAsGSFUhH2S89OfOawEpP3brDPkEMmySI1sg/1Kjo5tAt5SjCuR4P
         9rGltGkfuAATE+pJWnjHS8FBeg8p8ce8M2wUb2YeQs6xLc690Wf4tc1wsN4/JfQnyfED
         n94x8EkWsH+xQpK0kMHNJo7g662TEG5hwYp9+05vvp07sOGw6kDSQ0XpuqWeV5/3OFxk
         +fiw==
X-Gm-Message-State: AOJu0Yz+5Lg/XDyB0xInidQnzSUI3t4K8m6Rc2LaHifW6U9ZdrMFrP1c
	wJyePuXTDQL4M6D5EEwDh9E=
X-Google-Smtp-Source: AGHT+IHrWhEj86WzYWL6a84JcO1BoWmYmVa5WsWZqLO6yNPj2DSpacRa6t4UcmaO09lhMDici3w3bw==
X-Received: by 2002:a17:90b:3005:b0:27d:3be:8e13 with SMTP id hg5-20020a17090b300500b0027d03be8e13mr226491pjb.12.1700762642776;
        Thu, 23 Nov 2023 10:04:02 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.83.22])
        by smtp.gmail.com with ESMTPSA id fs14-20020a17090af28e00b002839815d352sm1809723pjb.25.2023.11.23.10.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:04:02 -0800 (PST)
Date: Thu, 23 Nov 2023 23:33:57 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v3] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZV+UDY0B8AEkdVxc@swarup-virtual-machine>
References: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>
 <ZV8lf8L8Me+T7iIW@nanopsycho>
 <ZV9FnjRH6VTwWaaX@swarup-virtual-machine>
 <ZV9MpLBwS1ndszzf@nanopsycho>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV9MpLBwS1ndszzf@nanopsycho>

On Thu, Nov 23, 2023 at 01:59:16PM +0100, Jiri Pirko wrote:
> Thu, Nov 23, 2023 at 01:29:18PM CET, swarupkotikalapudi@gmail.com wrote:
> >On Thu, Nov 23, 2023 at 11:12:15AM +0100, Jiri Pirko wrote:
> >> Thu, Nov 23, 2023 at 11:01:19AM CET, swarupkotikalapudi@gmail.com wrote:
> >> >Add some missing(not all) attributes in devlink.yaml.
> >> >
> >> >Re-generate the related devlink-user.[ch] code.
> >> >
> >> >enum have been given name as devlink_stats(for trap stats)
> >> >and devlink_trap_metadata_type(for trap metadata type)
> >> >
> >> >Test result with trap-get command:
> >> >  $ sudo ./tools/net/ynl/cli.py \
> >> >   --spec Documentation/netlink/specs/devlink.yaml \
> >> >   --do trap-get --json '{"bus-name": "netdevsim", \
> >> >                          "dev-name": "netdevsim1", \
> >> >   "trap-name": "ttl_value_is_too_small"}' --process-unknown
> >> > {'attr-stats': {'rx-bytes': 47918326, 'rx-dropped': 21,
> >> >                'rx-packets': 337453},
> >> > 'bus-name': 'netdevsim',
> >> > 'dev-name': 'netdevsim1',
> >> > 'trap-action': 'trap',
> >> > 'trap-generic': True,
> >> > 'trap-group-name': 'l3_exceptions',
> >> > 'trap-metadata': {'metadata-type-in-port': True},
> >> > 'trap-name': 'ttl_value_is_too_small',
> >> > 'trap-type': 'exception'}
> >> 
> >> 1. You have to maintain 24 hours between submission of one
> >> patch/patchset:
> >> https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html
> >> 2. You didn't address my comment to last version
> >> 
> >Hi Jiri,
> >
> >I have read the above link, but missed the constraint
> >of 24 hour gap between patches.
> >I will be careful and not send the patch again within 24 hours.
> >
> >I could not understand your 2nd point.
> >Does it mean i should not include
> >test result e.g. "Test result with trap-get command: ...."
> 
> Does not make sense to me. If you put it like this, it implicates that
> the trap attributes are the ones you are introducing in this patch.
> However, you introduce much more.
> 
> 
> >Or
> >If it is something else, please elabroate more, which helps me to address your comment.
> >
> >I will try to clarify review comment, henceforth before sending new patchset for review.
> >
> >Thanks,
> >Swarup

Hi Jiri,

I will submit a patch which has only trap attribute only changed.

Thanks for the clarification.

Thanks,
Swarup
