Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4490C77B7E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jun 2023 07:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29CF541693;
	Thu,  1 Jun 2023 07:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29CF541693
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzrpdr+v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqjuZ984db_w; Thu,  1 Jun 2023 07:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 07DBE402E0;
	Thu,  1 Jun 2023 07:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07DBE402E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E032AC007A;
	Thu,  1 Jun 2023 07:56:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9772C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jun 2023 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE2E4243A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jun 2023 07:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE2E4243A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=hzrpdr+v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k67OTsbttiuf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jun 2023 07:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D67842438
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D67842438
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jun 2023 07:56:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A40662CD3;
 Thu,  1 Jun 2023 07:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1564AC433EF;
 Thu,  1 Jun 2023 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685606186;
 bh=zy6FD3ieq9VzpaczjqQeq4turLjMaDfUirLGdrUvrRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hzrpdr+vftwHjZujbikxA7vGJd48YfbEE7beZiaLvSofMfOTfdYZxvoLnJnl5fSLI
 LS/gbTJ28xOK0yBM2aTT0CsdWZuW7J8AjXMMAzOUNmUFZUQFFbOyz8qFtBggIxYAtH
 xusfTFvu5Qs3P8J7CpoIrMLI1HAWQGgOafA93PyV6/+pfMjn0M9mpubH/ZrcGNnTd1
 b47x/Mj+emASiuhI45Nog1aPycW4wbvZmrGr03UZ+I+0PpIjBl66aau6c8x6vvJ4Us
 R4rCj5U0UmY89xiSt6D1lLKn8t+f9+qeWOgllP4EJSqR7zbB6/Tpau6TZtByfStvyo
 N8CO/qbQ4NOZw==
From: Christian Brauner <brauner@kernel.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH v4] fs/sysv: Null check to prevent null-ptr-deref bug
Date: Thu,  1 Jun 2023 09:55:45 +0200
Message-Id: <20230601-puder-unbekannt-9d74525f40d7@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230528184422.596947-1-princekumarmaurya06@gmail.com>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230531013141.19487-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=brauner@kernel.org;
 h=from:subject:message-id; bh=zy6FD3ieq9VzpaczjqQeq4turLjMaDfUirLGdrUvrRQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRU+L11uWbFsP+T8uqmzbkBs2fWmWxNcp59hCXr6RrLrvz2
 +Ul5HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOZGszIsKSrrMWh/MryuA8rfOpX9J
 ZFd1zdLXxIQGVmW7IqzwKJZkaG9+8z7yZrmzalXNuRFrho2lv59cvsV/NxKGSXCEi4FJ7lBQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Cc: Christian Brauner <brauner@kernel.org>, chenzhongjin@huawei.com,
 dchinner@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 28 May 2023 11:44:22 -0700, Prince Kumar Maurya wrote:
> sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on
> that leads to the null-ptr-deref bug.
> 
> 

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] fs/sysv: Null check to prevent null-ptr-deref bug
      https://git.kernel.org/vfs/vfs/c/47f9da4bc5e6
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
