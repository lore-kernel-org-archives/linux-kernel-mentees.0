Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AD3164A0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758613644; cv=none; b=fSNfI5YAcGkp5FtTM4eAqyPGUCvk3KwNOceJjfYl9ljEn/KXvJpGUdbp6GLDOjsck9YAhipEVdvJjSTulE5SRWQSZoOS6RWVjmf8e6zBpfio9aMP2iOJXSX6lNsH8oR2AggOzMfdRaAEHSaDOURQFnKIcG5V26MQAqDkfoqbm8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758613644; c=relaxed/simple;
	bh=m6w75x5KmuboRbte2t8Bef+Y5vLZQaZtpC0JTZQjfAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHue9zICSbl/cSW9o3Y0vmRIYGx9W6u3WTEaK6JOJzpMQGmghw3Unt6QHEPzRmM4MVBlujCkQbyd1k4Q3k22la9A9z0bEAIkhz1CJICQR0XcndWx8KutWGyDgtzFw3DZ5xAebduCK3PdyyeJiOJGt4NQMVp9VgqrK8bles3O69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2QO3NFS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2QO3NFS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57f1b88354eso1777417e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758613641; x=1759218441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3zTrXIgrjNde7MVV+dQe94AXCJb9BQSJNtQ02xJwZs=;
        b=g2QO3NFSVSxMwY/n4AWEmPd5EuKB1vsTrVyJFzYQtSMsQTKa9LPtpqyYeqGRrkAl5+
         100sy2dF6rgMRBuiia5t/qDfPVNamY13DLFYXpSkWj2U7HBGa9gMmRqOhrlI0M/noCOC
         G1yV7VGAmhQVrh2/qohLk8AV7uuwj3vbFG6KqlLlJrkIB2DW1o44mHHPQQOlmR2LsWYN
         yMFZ0m8NZ9VazOXir9yfNto25waj3E7RHXol84QixpBcBeiHksAckdMug5GiQQJKeGeV
         246XuzliNuIyHE/DkezzPamv+IisWZWXKwbIT+VWlzwEfyC2SGdqtMDsDcY2uAnh3Qmf
         poWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758613641; x=1759218441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3zTrXIgrjNde7MVV+dQe94AXCJb9BQSJNtQ02xJwZs=;
        b=ksQYxMC/R3aiMEMWbPxmJdAoqhzcRccW+Aol47Bvwn/8DbfE1aw+nmWgsy3bkCTHk2
         DQaEsxpX7UVS1up7E5ilxGZ+Osj3XAlK6Ui3j9x9320tV6JJIc5Mhr+JapyKypO1l+P3
         SXU4k6zJputiidoHtzpLjx3/r9yqMDD3LPPhLFSlISUdRXE/QuSfp9132UVuqI+W48gt
         ySCaTDgX3hzDvEgzz+brUOqQozCyWMM/o4w9k3fH1ncXSCsTIgDRdHV+n1nVsRSOkL+6
         12XpCkFIZJ7+CiF4wEzqYgi3d22UJalLNgG9QFWAHXoK7zBKwQCu+MUUm/M7qudrS6Ng
         Z0kg==
X-Forwarded-Encrypted: i=1; AJvYcCU2NZJrQz2Um1/R82X1OQsGvYos+P5XfsYdCPGZxqVaM8w9lwDlG/NXNRdLa5alvxf/DhuGAbNMyKlx5a9yQ6xNq2CMnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwXcSiE6UgbUYUMNbYKE2KaYvJf46KkVW6jwY/y+4eWIHFlJNG
	pBvwcuW63XR2GXFh9T91ShCagj6U44kj96D2LKz5Yfx7rkU8PSXQSl3w
X-Gm-Gg: ASbGnct/oZCzUnSKSXVDKYX3hDBNrf7eFA/mWpYoczuOCMW4EQ3ZTjm9REoGwgYlTJC
	FJSPbaob4A2d9IQB/ExgqhRbdco20MZcMO6JXPGB7hynZRGbe+B7MBxhC7+S+Y5U75VCTvtzG/m
	0LTjAmILkZaIFWw57MEIvqMDAYlDZ3cfD8qWTTTHelmLLuTrXpWIdAv3CJF0ql3fdPZJ/kNnjH1
	0wJWIaXcnJnPZUlxl8gwfdv45SHDZ0HUiPUf2Uh+tTS08/kPl05SX0wuaHffaBpBjuG0pUOsH7I
	tzBYPvE4lhNSHPG9v3dx/W3sxnuGtNImOr3K3HNdrf7wH8jrYXy42rF5DshfsF8o2RB0KW+jk/F
	3mTbSoFuIr5myPribCxnXbV+/6c5ZYG7+5aI=
X-Google-Smtp-Source: AGHT+IHdpC5HbX3ix1zT26Flp+EGyUUBeKiByHFSuNEWqr8rJkXfKIJvyKcJk6flJER7ibjGFmTI7Q==
X-Received: by 2002:a05:6512:4207:b0:57e:1e1b:dde5 with SMTP id 2adb3069b0e04-58071403f46mr357677e87.25.1758613640434;
        Tue, 23 Sep 2025 00:47:20 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57fcb89170asm791542e87.63.2025.09.23.00.47.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Sep 2025 00:47:20 -0700 (PDT)
Date: Tue, 23 Sep 2025 09:47:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: I Viswanath <viswanathiyyappan@gmail.com>, andrew@lunn.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, david.hunter.linux@gmail.com,
 edumazet@google.com, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, petkan@nucleusys.com,
 skhan@linuxfoundation.org,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250923094711.200b96f1.michal.pecio@gmail.com>
In-Reply-To: <20250922180742.6ef6e2d5@kernel.org>
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
	<20250920181852.18164-1-viswanathiyyappan@gmail.com>
	<20250922180742.6ef6e2d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Sep 2025 18:07:42 -0700, Jakub Kicinski wrote:
> On Sat, 20 Sep 2025 23:48:52 +0530 I Viswanath wrote:
> > rtl8150_set_multicast is rtl8150's implementation of ndo_set_rx_mode and
> > should not be calling netif_stop_queue and notif_start_queue as these handle 
> > TX queue synchronization.
> > 
> > The net core function dev_set_rx_mode handles the synchronization
> > for rtl8150_set_multicast making it safe to remove these locks.  
> 
> Last time someone tried to add device ID to this driver was 20 years
> ago. Please post a patch to delete this driver completely. If someone
> speaks up we'll revert the removal and ask them to test the fix.

These were quite common, I still have one.

What sort of testing do you need?
