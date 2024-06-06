Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A0282FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Jun 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717662673; cv=none; b=hw419BO9Euzjghlm7Gnujt8GKIWp6+RxceuVk8EUWhRkvtkM31+YH6DXLKb2q+ZBwoBXakjMKdx+vjwaTwIuT25bf4wBXU0gk0yzZMFqGZhJn4YE4z0IJFt5wHzRQQ9bhz0VCnlSJrHy4Y2Wq2HIg35Jl9UzvFdL1tCYChAKH0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717662673; c=relaxed/simple;
	bh=gtSeDpwtTXP76h/L9LNnnIb5WqY2J6aN92FdZrtanvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZRrjVtrYlEAkV8IgTQm9hvd3k6u2rGvGOzFV080b6pYzVtvzvNerbsCUloXGvwxpSzbtad/pP07300OjwMMjLQ48rLXBgJMORzYN5VSClaAADfU3lITVjcxVHU3qAtvpUTR3xEzowKj618DoGtXO/B4Gddjr1VqtwQjZmt8lSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKi5dunJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKi5dunJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C4F41684
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Jun 2024 08:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSGa5DZBgatc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jun 2024 08:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bentiss@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2077E41697
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2077E41697
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pKi5dunJ
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2077E41697
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Jun 2024 08:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B53B261CB1;
	Thu,  6 Jun 2024 08:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D194C2BD10;
	Thu,  6 Jun 2024 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717662666;
	bh=gtSeDpwtTXP76h/L9LNnnIb5WqY2J6aN92FdZrtanvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pKi5dunJZ8ff+rFzh/kCYAArxYveGq9xJZsXqXcbJ3zdztBRWxO+HLU700ysqhl00
	 KFZ9IF2EFJf8mfdplpmK4ZsHJ1Smiwb7Ed+oIlOz7F+laBNmH1xazhNy+zxCvgM1rG
	 ZGmMAH2DPAmfYZ/oYLNi5+OfPVfsagNQau3y84/BJC3DXcVuf2fze5vDxtQKfZ1JWg
	 iso4FP56hZ/Ls2kxai2H9VycCd6itFjK1pBxfXY3Ki80SDaS5X7gYjv4EquSoRTr2Z
	 fE3/78kJgkABsPDRJYGs5ee41uOUtxep/tHXEFyd1tjtFvDMKcMirHCPoXp2KeLs9V
	 QCpNx+2iXQL1Q==
From: Benjamin Tissoires <bentiss@kernel.org>
To: dan.carpenter@linaro.org, Andrew Ballance <andrewjballance@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luke@ljones.dev, 
 skhan@linuxfoundation.org, 
 syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com, Benjamin Tissoires <bentiss@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>
In-Reply-To: <20240602085023.1720492-1-andrewjballance@gmail.com>
References: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
 <20240602085023.1720492-1-andrewjballance@gmail.com>
Subject: Re: [PATCH v2] hid: asus: asus_report_fixup: fix potential read
 out of bounds
Message-Id: <171766266391.2918443.4596267274284818390.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:31:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Sun, 02 Jun 2024 03:50:23 -0500, Andrew Ballance wrote:
> syzbot reported a potential read out of bounds in asus_report_fixup.
> 
> this patch adds checks so that a read out of bounds will not occur
> 
> 

Applied to hid/hid.git (for-6.10/upstream-fixes), thanks!

[1/1] hid: asus: asus_report_fixup: fix potential read out of bounds
      https://git.kernel.org/hid/hid/c/cfacaaf33cd7

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>

