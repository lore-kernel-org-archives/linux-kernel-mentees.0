Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E5DEE49A5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Aug 2023 11:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342C883BF4;
	Sat, 19 Aug 2023 11:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342C883BF4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HAQ6LryM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lofQXhC-bbyt; Sat, 19 Aug 2023 11:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 28E8683BF3;
	Sat, 19 Aug 2023 11:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E8683BF3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 047F6C0039;
	Sat, 19 Aug 2023 11:48:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5402CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 11:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279E040186
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 11:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279E040186
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=HAQ6LryM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCL7S4e--YDu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 11:48:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3D6F4012D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 11:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D6F4012D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 398AC611F9;
 Sat, 19 Aug 2023 11:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303DBC433C8;
 Sat, 19 Aug 2023 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692445689;
 bh=A9tgsTdBMhQA/WJpr5nRjwwiNo470PILec1afwIdDoE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HAQ6LryMFjY2tRHa+R9xdI5OJBUao5XIAiOUYvUYLO2fk98nXL1koc72ROfCLeU21
 Zbg8xR7k+XFt0EVR0Uppc6WlHERuL6F/l2bLZZDV0i7bVBX+JhivFzypcoUoTMLc1e
 TvOKj4HKJLQPzAuaZAoVHnpa3cW7q3SaFYZuO2YUReHW0qPA9CGqHC1+Bm5zXlDsGi
 q8UW2boyVaJ8dBZj/mzYiDf+/fU6p6T4XB4wC0S7Xlt2PJwy+ti7bzc/Y5kYNaMj3k
 7vjlhV0pwo2p6YymaJVxcSuKVlkBPHbpMQbZaPCfxthmc8Xv3IK76vY/s+klvpjKZx
 mgrRrT4+AsmYA==
From: Christian Brauner <brauner@kernel.org>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: Re: [PATCH v1] fs/dcache: Replace printk and WARN_ON by WARN
Date: Sat, 19 Aug 2023 13:48:03 +0200
Message-Id: <20230819-flexibel-erzhaltig-a16a0fd46e24@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817163142.117706-1-tuananhlfc@gmail.com>
References: <20230817163142.117706-1-tuananhlfc@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=brauner@kernel.org;
 h=from:subject:message-id; bh=A9tgsTdBMhQA/WJpr5nRjwwiNo470PILec1afwIdDoE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQ8WPVk292rTg5nUuY5XLueNLmLs3ShoMR0/feZfxuqny/Q
 U1/L3VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRWdyMDGtXrEjdK/x4ouvUffrnj1
 +WNLt0NX9hZeYhJ8v1x58dic9nZHhlZs70fduP8tNpFusvdbMd16hIb/olHPX86pdY/3XN5owA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
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

On Thu, 17 Aug 2023 23:31:42 +0700, Anh Tuan Phan wrote:
> Use WARN instead of printk + WARN_ON as reported from coccinelle:
> ./fs/dcache.c:1667:1-7: SUGGESTION: printk + WARN_ON can be just WARN
> 
> 

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] fs/dcache: Replace printk and WARN_ON by WARN
      https://git.kernel.org/vfs/vfs/c/7fbf9abcc77f
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
