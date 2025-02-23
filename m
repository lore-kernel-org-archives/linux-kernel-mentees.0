Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711EE1DB54C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740298502; cv=none; b=SpdUFQB5rNzXrU6OlbKfwoo1KuVGys9agyFvdvnVVAJqEpxNfAavxiwS8uu2V/13b8eXySzq7dBmxOBdzKUkH4Emuce4/nvPG+dbgx4XFxp1SDoy5JC0/fDS+pHyEgrcL88tAyJu3iy6OtVZCwQ553nvBuVBAgMxCfPWBkDoAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740298502; c=relaxed/simple;
	bh=cbzfrMEqZxRJLVM2oPP1TsaGDdKebLpKxeWTajkeyG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6F1kDLjhMFN9zDttemPepcuwJ1DdcJNDnkzzcCh5rnYO8x1ZWKcVEW0rc8IlsDmU8ChpVGwThnTuPf6kV9W5MlpAZPYySmcEDowtDcIP6bHYHGaS5NI0Ex4LuZx4T1aTJuy/7m3ZsVlxKRdgACwzq/0mx6ij5ORjPBoVLlk1lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIiKfewt; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIiKfewt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009D5408A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 08:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3udY3mGOaIcG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2025 08:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A3EF408A6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A3EF408A6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mIiKfewt
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4A3EF408A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 08:15:00 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220d39a5627so51693135ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 00:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740298499; x=1740903299; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKARCf7mqqryQEHenFr1LDZd8C0PV+DchvWZwfM2sCM=;
        b=mIiKfewtlChK5PxyribqI8eRQFQTYNyskN6TBHBagT1QBfozMwT9aI2c3UnaC7ITSQ
         +3/TxAXZXug07WR2DgqCK86nn+n8c5DPfGMi9IPdH4955uGx6cXC38CZ0qN9mjoXS7Ap
         jyfysq8YzYdkEX6/YCAcN01GX/qndIm6393D2siruLbxOWKT1u1dXwchdP/x2LeAu/tR
         cLvmph6sMo7pFGiYX6OzM6KRnDm3mZWpoBTeFIEqaWiapFlbIFsfaWEN144l6Nxym3hZ
         0uvekzWksb7yBRvC/qFn96pL/XJRicbSsjrmF9Y0D25NCTZz1TRrBiaiPp3QWXpYS7Ua
         0MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740298499; x=1740903299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKARCf7mqqryQEHenFr1LDZd8C0PV+DchvWZwfM2sCM=;
        b=Jb14CgrPzsyf02jSymYyFUwyOc2HAgUqYJ8iRLHygpIEWDku+7cdwgL2qR07/xx/9E
         ibUSUr7vct/Bhh+HGq8VKakAS+sQAmT6t4AL/SY9ndnCycEKDtmhMVfB2IDM+jmYOiLX
         9MH1/hiWZp3ZKXwnVICqEtvqVOAzWZgNPApjRyOgs7rVc5HZKvodNZ/TfrJzgnguI9H2
         jJY6+6GsAkuVKJ6Fekis43Qf7gy1Si+IpbsBES3CuzMxeeD7/oOGVuV68telMZSBmoi7
         2ulmXSsp/XTFKWC8Er90T8+dWZ07r12zpdB0AdAtjKd0Ert2Q+lNjZm6s4VRteMPMEzB
         7Ptw==
X-Forwarded-Encrypted: i=1; AJvYcCVmK08v41ceI3sJFrjkaEW9CJqpezs49vMPCZI/vvAGMTW31nU9z6QxXwi+kQ/ziMFH8V1dVVBvWR5oFgTcuZBYn7X4jg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyscwICaNyfos7/HKjqRJK4xCWdNH3BquHwfgSwcpn22zsB1eB+
	CHTBE6XP3QOE5amkgAEdTnqXDG5FdTlw+2XWLJd674YVSg/EgpgY
X-Gm-Gg: ASbGncuaoPAOLSTLpMt+UHvSgQ4oXIUipij5IR8/Xc8IwV60odazkaLXgNSPRhuMkiO
	eZJ7Td2EYL3ZIIPjluTcD0axUq0RxYJaFQa8jGSzGY4G3ssb0CKP6pwql4Wb+A5E3P5lFs5LmVN
	14Pgf2AngROYt6bTPxQRPW+kSuFHh2JAnn479NsbnkoM8lKIQ8Z6B5JvgBiR8J+6U0TrDlkIlUn
	+GxLjAWJ5X9EECtnUeMmR+jMHU28jrfzbOg1N3BIEKBn5AVvODXTt9MAbVm/9d+d5h2pRWdoJRy
	8HjJlkqTWMgt+gE5afif+Ui7ii7YiwQyO5Fj+9/Z4ddWHPB7
X-Google-Smtp-Source: AGHT+IGWqsGVBXu6QfQcNok6lJbLQAhcp3fm2r7bxkGvjKrRVRv/3YPfBgx0XgSn1Yg3T5NKwLcEqw==
X-Received: by 2002:a05:6a00:228d:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-73426c8d24fmr14045326b3a.4.1740298499449;
        Sun, 23 Feb 2025 00:14:59 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:b161:5a88:9ecd:1b07])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326b5ef448sm14536311b3a.173.2025.02.23.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 00:14:58 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id E9693ED9140; Sun, 23 Feb 2025 13:44:53 +0530 (IST)
Date: Sun, 23 Feb 2025 13:44:53 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftests/mount: Close 'fd' when write fails
Message-ID: <Z7rY_eAnaXfnDjtj@ritvikos>
References: <20250222114709.50011-1-ritvikfoss@gmail.com>
 <20250222121249.50588-1-ritvikfoss@gmail.com>
 <zshes4xtyir7zrrybeqj2amrxyctwqnuvx2tqyktv4vsfstxqi@pvdq2rb5m47j>
 <Z7qiOE3EXo8BtdY8@ritvikos>
 <5lkv3sotpv6pvs63gds5crwkrvs5xjtdkjmjcnzrc3c6d5s2wg@gzzfvghkp2qm>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5lkv3sotpv6pvs63gds5crwkrvs5xjtdkjmjcnzrc3c6d5s2wg@gzzfvghkp2qm>

> Yes, the kernel will handle the 'fd' cleanup automatically, but
> the existing implementation already closes it before exiting.
                                                       ^^^^^^^
Whoops! I meant 'returning' there.
Wording issue on my part :P

We're referring to the same thing!
Thanks for detailed response :)

Regards
Ritvik
