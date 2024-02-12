Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EAE7468
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707716947; cv=none; b=oXIgWWyhQd/B9Hf4aWhQBFHSKXmfHnpv7h0QpykzVtHRdnfDznEJOTblz7rgCqi5HumMI4blFjCNlODxbjljcYn9BsePGHrj2FgmrqD7LRBg13Xvoubm2tLO9UAeZh0BdP4gGoNEEkjVYxCybPa17xcLtlnYr2dnL6tk9Q7qPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707716947; c=relaxed/simple;
	bh=Lc/w/cxoeZuQtJ8zSB57Yo7ACdM/KC7dv5cLvDWenbM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=A7FY4Fd5P63LDIzgoxSbAda1qXjUxGP9IgG4/mnfkSsl/CB3PIta5Fo3h548+zqKqELOO7UFyyv9/QMoQO4Hk4bjsxEzLKAEHIAUYoq2x5FovEECnfIl4BLZJEjK+fnZkWMn3EpUI3tjrMu2jeCw1Iw338nZViBSBQoJHvKFwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V89/b8EY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V89/b8EY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 103C0401DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 05:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pepg2uz1zQLt
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 12 Feb 2024 05:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 183E2400F3
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 183E2400F3
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V89/b8EY
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 183E2400F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 05:49:04 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e2e42fb159so556128a34.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 21:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707716943; x=1708321743; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc/w/cxoeZuQtJ8zSB57Yo7ACdM/KC7dv5cLvDWenbM=;
        b=V89/b8EYsKy6TVCeKB7LQKktWnu+vDavh/ULBXbz4W7q/WEKztbjmcbVqlKOPorXe3
         QyLyOC+x9tDorh5bb1BKY1PGhuDeZOttmK4HAZYh08cDAWgvjmzN/opZP5HxyQrt0bYA
         Z8IpwXV5FCp5lVAI2dY2dhICzYJKi+EocFBP/CYfgY8l3wvypuxvaUe4qTG2/gwWbvsY
         8AtwZES5hpiJVOoLTUqhkdJEMdVZF3z5m7I4sbzaiK9+BuBxCaorW84fzG7PvloK8QeR
         LqdZiSUAL1mJzocpRPLNfbb6bFED3bUzG4dGdPGH4Ho10+EjsCif4nxB8jVu/QulL0wM
         vgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707716943; x=1708321743;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lc/w/cxoeZuQtJ8zSB57Yo7ACdM/KC7dv5cLvDWenbM=;
        b=WVHIQqjNeihPpa3TlsOn29vclFk2P1T42oieysUzDRrGiuuIXIL09lZAeWEHA01nXg
         /WMJKpyU5QyS2qMP5Rwq8XE8mTjis8L2Z2ez+8IAgOlOExR4jU0Kcd3/GSmitKBOwVv0
         gPVidVml8KGRzqr+qRBXgMhQ0stWQ8fp4CIdm7TmfCH33NDp8vELuweIBTBjHcF08rBN
         xhf4a0dHxBJr2VVOxegmfALfAKX5Imrv9tLwOHy4xj7o4YOHOAaKqPRyU5KXmOyfM9ts
         kvBxtXf5ZLHabnC74eDy0EpvTPB3NcIrtd2AYb9V3a0ATE1Ik1UnvQXFOZo0wA2JGXY1
         RtHw==
X-Gm-Message-State: AOJu0YxMJXfNb0MyjHvI8ob0xmZuyHBb6p08r5ikMtMBZcacbgG1C6va
	UFW1LrkdEW2lU93tPznlk85X+m/Z3+xfmez6RT8eKtPKjCLbqr6D
X-Google-Smtp-Source: AGHT+IF93Q96PWuIbJC8nHjbJf1rXR5ozPu0Z4Vq8EzpC9lxn23x4aky2fSJBghovWEbSgIGEPfsag==
X-Received: by 2002:a05:6808:14c3:b0:3bf:5e23:5082 with SMTP id f3-20020a05680814c300b003bf5e235082mr8086961oiw.10.1707716943476;
        Sun, 11 Feb 2024 21:49:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWd9/jES2EFRMOpHbZK48EbPBYXh750lyuOW0p5wYHvHkuqHGvYltI31J3eEDTjlRX4ALfTrR7oBSQjXKfxcyzIVOWLjd4fcQKvLY8o6dzB6AOPr8e/qmGWoLWbJ4K4nn7cozmpC8NpqJTmVIp7bLAa5o2CzX9JQ7W9Y+yq5hbhnHJMJCPtnGO+S/qglFqz+RGz99iIyTidEueW20ysX2I/4PZ4yg7umvUo4YoRGmXcALvWSADxLyJ5N/x9owhN9IXLbnXBP98XKyMKObGeofxS8HtEXTtpxAmH4GLKnewa2Zt7N6uYlVY=
Received: from [127.0.0.1] ([106.221.234.142])
        by smtp.gmail.com with ESMTPSA id q19-20020a637513000000b005dc191a1599sm6083749pgc.1.2024.02.11.21.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 21:49:03 -0800 (PST)
Date: Mon, 12 Feb 2024 11:18:57 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shresthprasad7@gmail.com, skhan@linuxfoundation.org
Message-ID: <39f63f54-89f9-4c9a-81e5-e6ccbd2c08e3@gmail.com>
In-Reply-To: <2024021158-rewire-duplicity-c31c@gregkh>
Subject: Re: [PATCH] Fix malformed table error in gadget-testing.rst
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <39f63f54-89f9-4c9a-81e5-e6ccbd2c08e3@gmail.com>

> What error, sorry I see no context here (remember, > some of us get 1000+
> emails a day to do something with, context is key... )
I see, I'll keep that in mind. There was a warning being thrown out about a malformed table in gadget-testing.rst, which I foolishly thought I could fix by replacing all the tabs with spaces.

The thread mentioned previously attributed this warning to the table begin/end line segments being too short for the word "max_segment_size". I hadn't noticed that it had already been merged as I was only looking at the mainline kernel tree.

Regards,
Shresth
