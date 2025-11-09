Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3C2D63E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Nov 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762698463; cv=none; b=HnCtlQom45hFKb7gnF7JRgLvj0nVtUnppI9jE47JM2j5j0puIOml2oo1ZPNnJeUtk2hCjHigXeP5VAtP8Ecjk5v6HToZ6kLFpZKzUVHojt96KPb+0nmLtWVSELWO7hBUUZIQ29c3S1JnaPwQXNK9ZzvcaW27ZIjXfdnxnQPB/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762698463; c=relaxed/simple;
	bh=SpvXDs2j7AXqlcGpc7McHEt1m7D6/APdzLmAM0bQ1jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eronD/gWRT5IC1YCm3QRLDGIeMJ87n6xDyDdSRyn0qc0sI055uQhgOWycHWtETsgSiggPwVtVb2PPeUHGDtSgIb6LimPVcGAqhuMrfLQ5lxg3kYLAFVSq4ljOTvtKHxPOVcjgrk0bfdgA5M4z0jsZJFpbhwlzx12xm95h3msXrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=TquqnKJl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="TquqnKJl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2769F405C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Nov 2025 14:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reYtqMFe-Jyu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Nov 2025 14:27:40 +0000 (UTC)
X-Greylist: delayed 666 seconds by postgrey-1.37 at util1.osuosl.org; Sun, 09 Nov 2025 14:27:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 078F1405C1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078F1405C1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=TquqnKJl
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.121.94.169; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=<UNKNOWN> 
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 078F1405C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Nov 2025 14:27:38 +0000 (UTC)
X-KPN-MessageId: bd37146c-bd76-11f0-84a0-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id bd37146c-bd76-11f0-84a0-005056abad63;
	Sun, 09 Nov 2025 15:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=mime-version:message-id:date:subject:to:from;
	bh=89xTxxi7WXo66xAJrmmYoDWxkHI53nhAfpzSreisjos=;
	b=TquqnKJld2kZxYqDSDW61rDoBlf22mPo6TfW/7Q+Md8yxJoXC+Ig/neWT3faCKF/ylgzVfPi4zVCg
	 7Hpo4Qa+zFlveYxdu53XTspt76jUqXNRE7pJxrU0hL/b5h1sTQvddrMsW4ecWwaMC2oL/yNaUHtsSo
	 fYGVmRCJSmnuaAZjukc7a6PRZD6pFnLxASSmDdCzPJe0otQPszvjolrk5WO3FaC8RAfduNjoeBARpM
	 qMGXgZ/xPc91jh0xPlfRFxWNb/6ly65yeyu6f+VY18z7S8VHveE01gQnoi6ly6XmAE5vWRP7zm7zs6
	 rbPYc6tnBmy/Awpma2YYkoMp+XdVuwA==
X-KPN-MID: 33|n8DSeb37nfS0x54DzSEssAm4O/0ClqDi3Y89ovTqjIBratMb8b98bQ3y1j4V3Q6
 p4Lk2tF584I+9Rz9hy3insccANISTgs80wmgGVPJmqFw=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|McpHa8c7CC9wK46ayi3TzzoJ8B3jULO0BZWeLHFxzgBx6JoTAp5V1u3NKrqlIkm
 ef2UruXCnezUVGV8P9dXv5Q==
Received: from lt-jori.localdomain (unknown [178.226.144.191])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id ae23ae84-bd76-11f0-bda2-005056ab1411;
	Sun, 09 Nov 2025 15:16:27 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: jack@suse.cz
Cc: brauner@kernel.org,
	gregkh@linuxfoundation.org,
	jlayton@kernel.org,
	juntong.deng@outlook.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+2f142b57f2af27974fda@syzkaller.appspotmail.com,
	syzbot+5ad0824204c7bf9b67f2@syzkaller.appspotmail.com,
	xiubli@redhat.com,
	jkoolstra@xs4all.nl,
	skhan@linuxfoundation.org,
	david.shane.hunter@gmail.com
Subject: Re: [PATCH] fs/minix: Improve validity checking of superblock
Date: Sun,  9 Nov 2025 15:16:20 +0100
Message-ID: <20251109141620.58007-1-jkoolstra@xs4all.nl>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20231012114558.ikpxqs7zleq6tvri@quack3>
References: <20231012114558.ikpxqs7zleq6tvri@quack3>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Jan,

> Also s_log_zone_size is odd. Looking at how it is treated within the code
> it only matters for reporting of free blocks (but zone bitmap is really
> treated as having one bit per block) so I don't think we really support
> anything else than 0 there but that would need confirmation by someone more
> knowledgeable with the code.

You are right Jan, there is no support for anything else than s_log_zone_size
= 0. In fact, for minix v3, the reference implementation has

  /* Zones consisting of multiple blocks are longer supported, so fail as early
   * as possible. There is still a lot of code cleanup to do here, though.
   */
  if (sp->s_log_zone_size != 0) {
	printf("MFS: block and zone sizes are different\n");
	return EINVAL;
  }

Older versions of mfs apparently did support multiblock zone sizes.

There are more (small) issues with the code. For instance,

> Also based on http://ohm.hgesser.de/sp-ss2012/Intro-MinixFS.pdf I think
> s_firstdatazone is constrained even more (since there must be inode bitmap,
> zone bitmap, and inode table before it).

firstdatazone should not be used normally. Better to calculate it in place.
Also, in minix_new_node ENOSPC is returned if (!j || j > sbi->s_ninodes).
However, this is really a EFSCORRUPTED as it should never happen.

I have been going through the code in detail to see how best to move it to
FUSE. Probably it is a good idea to write some sort of adapter so that as
few changes as possible are needed to the current implementation. Such
an approach is also more likely to work for more complicated deprecated
filesystems. But I have to see if I can bounce some ideas on someone more
knowledgeable.

I can submit patches for these issues in the mean time if you think that is
useful. Otherwise, I will include it whenever I finish the FUSE driver.

thanks,
Jori.

