Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0456FC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Jun 2024 01:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718759750; cv=none; b=jjXbNGtC6lXFGBVNl6KAGZhlF1hTa9MAumyI21kLHui1cRd6fyHvwTBDnJ9Z33MjWpRi8lSoxfsyp5kwDquOKFS9KVZXsoK7M3tGJkYaej3idFG1foHQGCTGaoT0d33x3YufsBl9BV0xtQ7j0iIrViCljWtSSqogPp+75kZ+/kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718759750; c=relaxed/simple;
	bh=wuhpJWllzquyP6xKZ60kyLvUqRhn+Hv4ZzsFsuIdsGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcOMjINgw/VwnQCtMiWEYa6NaIET14Fq3fL+6tIV3Ye7+ZbUPOgA7XCLnFo6weEl83bdCDaUAC4ce6uvO9xflGl3pZxCGNRVqIgkP/1jKVTyoa/zMfLZkWfHKOmnl9ropzESRMZLapUXXeXh9Y9fL/EsfiPBFkc25zjxi8Hrluc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdKU/wd4; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdKU/wd4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2E24022D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Jun 2024 01:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qcKpq4r4uJ1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jun 2024 01:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4061D40225
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4061D40225
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VdKU/wd4
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4061D40225
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Jun 2024 01:15:47 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-80b8a8b06b9so1545415241.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Jun 2024 18:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718759746; x=1719364546; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jto+2KBAammyuRDteQwTTwC96pLpNXDsN1v2Rc0adi8=;
        b=VdKU/wd4vBBbZtrPPqXsVLDZ+AFI2NVXcJ/bFMiuQ++7t7Pkj30YisXelVTKRuRwta
         B2atYT/Mjk5h63Vv2bsLT8Al1f/2An/76rnSnQF5wW5eh4FZlu0jtSpndwPEK1mJs/6a
         kq29HyHST8Qw+/O6rWoSZelcewszwyQc981Giqe0J+WR00RZAEr1Cuk2Q7lM4KzpLjxg
         vjp0t1lY/4yvokgkJ7dYArfOjjNJjjo50UB95dYj14ycgB4PPbxZ+qE9MHyZrK7oIDeQ
         EiihJ+uWte+tQgjPWcXBtKfRbYSpOSlOAkUhwPC0gCH06TKJ7gUvJ5dLMtBhTV9Oqex4
         GoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718759746; x=1719364546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jto+2KBAammyuRDteQwTTwC96pLpNXDsN1v2Rc0adi8=;
        b=UQw7OJIfqmsV5Qre0GV0x10Hg9Uc9ldSByLXcizzUie2I7SMNokpBqQL0C1sjL/pPz
         2fSpMq28xSvCGKc19bcipVP5Ku2HlpU8Ujs/hF9Y3gDdHkesu5Kswd5uDnzUJOoDUOX0
         GUA93byGyKKIyAUne+W4pc/JuA0Ybn2X5bvadyAbpKwgbZTYdLLVVs8psrnNwBHTSNHC
         /Uufl08vBafsn4iUsamd4pBmVYtu5d21YUj0fKQdNjSjd8tgd4+0DIfJCOqp52CahPIp
         40A/D0yAN4P+HKZ2SSML6khOd1F+o/e3k0lT0eV2OFFIBi+Jd3lZ69paEaDPo4AX/1+a
         5MYA==
X-Forwarded-Encrypted: i=1; AJvYcCXaLqtw4LXC4SWFEDHhdx6V1fN/U72iuxCGTjjpCDTpbmBuN4SoaV2jOEMNL0/HLGb6qK6h3HIuMXOL1N5tWk/LZN3+sqfo/qaSD2Vy9CO1dXZhwUFf4PpMAgovg46F
X-Gm-Message-State: AOJu0YxZIR8L537n8OUHXCAHo7kBqWp1gIRg3oZxQdZlBXVMbHrGdkAU
	wb92P9bLq8tl6fAqq9YSBHCe5lrM+CrWuaeoQt1ITm6Q55W8ZoAB
X-Google-Smtp-Source: AGHT+IED2RB6niiAooYbdp9OYgJJykph+uwJBnmbFgzm6IbLsEA5q6INPNth1DNzRWj7t4z3iqiZZw==
X-Received: by 2002:a05:6102:1610:b0:48c:3c3a:55a4 with SMTP id ada2fe7eead31-48f13141063mr1547541137.35.1718759745754;
        Tue, 18 Jun 2024 18:15:45 -0700 (PDT)
Received: from x13.lan (2603-9001-5c02-c5bc-0000-0000-0000-1b5d.inf6.spectrum.com. [2603:9001:5c02:c5bc::1b5d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-80d89295847sm2004918241.34.2024.06.18.18.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 18:15:45 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:15:43 -0400
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: dushistov@mail.ru
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ufs: Use LUT for dir entry types
Message-ID: <ZnIxP2nxVaqNPbPx@x13.lan>
References: <20240610034219.14711-1-luis.hernandez093@gmail.com>
 <0485dd2d-488a-40e9-b0f7-24236b9c00ab@web.de>
 <2024061008-granddad-aspirin-4208@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024061008-granddad-aspirin-4208@gregkh>

On Mon, Jun 10, 2024 at 10:00:18AM +0200, Greg KH wrote:
> On Mon, Jun 10, 2024 at 09:48:09AM +0200, Markus Elfring wrote:
> > > As per the original TODO, replacing the switch statement with a lookup
> > > table results in more concise mapping logic and improved performance.
> > …
> > 
> > Can imperative wordings be relevant for another improved change description?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc2#n94
> > 
> > 
> > …
> > > +++ b/fs/ufs/util.h
> > …
> > >  static inline void
> > >  ufs_set_de_type(struct super_block *sb, struct ufs_dir_entry *de, int mode)
> > …
> > > +	if (mode_index < ARRAY_SIZE(ufs_mode_to_dt))
> > > +		de->d_u.d_44.d_type = ufs_mode_to_dt[mode_index];
> > > +	else
> > >  		de->d_u.d_44.d_type = DT_UNKNOWN;
> > …
> > 
> > May a conditional operator expression be applied at this source code place?
> > 
> > Regards,
> > Markus
> > 
> 
> Hi,
> 
> This is the semi-friendly patch-bot of Greg Kroah-Hartman.
> 
> Markus, you seem to have sent a nonsensical or otherwise pointless
> review comment to a patch submission on a Linux kernel developer mailing
> list.  I strongly suggest that you not do this anymore.  Please do not
> bother developers who are actively working to produce patches and
> features with comments that, in the end, are a waste of time.
> 
> Patch submitter, please ignore Markus's suggestion; you do not need to
> follow it at all.  The person/bot/AI that sent it is being ignored by
> almost all Linux kernel maintainers for having a persistent pattern of
> behavior of producing distracting and pointless commentary, and
> inability to adapt to feedback.  Please feel free to also ignore emails
> from them.
> 
> thanks,
> 
> greg k-h's patch email bot

Hi Evgeniy,

I am writing to follow up on my patch submission from June 9th. The patch addresses a TODO, "turn this (switch statement) into a table lookup", originally introduced on 2005-04-16. I believe the original commit message body may have not been written in the correct form and wanted to offer an improved version:

"Replace the switch statement with a lookup table (LUT) as suggested in the original TODO. This change results in more concise mapping logic and improves performance.

The ufs_mode_to_dt function now maps file mode bits to directory entry types using a LUT. Indices are created by right shifting the mode bits by 12 (FT_SHIFT), isolating the higher-order bits for indexing.

This enhancement simplifies the code and optimizes the mapping process."

Any feedback or guidance on the patch would be greatly appreciated.

Thank you for your time and consideration.

Best regards,

Felipe
