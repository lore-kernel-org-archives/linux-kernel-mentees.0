Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343C3C41535
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88124ECFD;
	Wed,  1 Nov 2023 19:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88124ECFD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jkGZ4Sqj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1dKpHSHZtc1; Wed,  1 Nov 2023 19:47:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 24D534EE49;
	Wed,  1 Nov 2023 19:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D534EE49
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F00C6C0072;
	Wed,  1 Nov 2023 19:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44262C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 19:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D6534199A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 19:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D6534199A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=jkGZ4Sqj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebDdvRzVL6hU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 19:47:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0FC402BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 19:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0FC402BC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DE3260F23;
 Wed,  1 Nov 2023 19:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFE7C433C8;
 Wed,  1 Nov 2023 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698868046;
 bh=lFenhhJtxWo00pd4it4baM7oXMawAiQgg1gGB5VFXGQ=;
 h=Date:From:To:Subject:From;
 b=jkGZ4SqjTNFJrLdTolnKhhSfMaAY54SofxBGkpn2RXYdjwPEbIe2dQVwbQKXYOHxL
 n24qLAxGHGfvhqGToWkhEGNm1oxnr6lDTf7RYpJnYs/kw3mOGTxnwWkD/ISuK6YdWE
 E2zi1mErSOUxZ7/FA3g0yjkgpMEaDfWLZtwUsq4A=
Date: Wed, 1 Nov 2023 15:47:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: PSA: the linux-kernel-mentees list is migrating to lists.linux.dev
Message-ID: <20231101-piculet-of-flawless-abundance-acd6cf@meerkat>
MIME-Version: 1.0
Content-Disposition: inline
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

Hello, all:

The mailman-2 system running on lists.linuxfoundation.org is being
decommissioned, so all lists currently hosted there will be found new homes.
*On November 7*, The linux-kernel-mentees list will be migrated to live on
lists.linux.dev, but the impact of this move should be minor:

1. The new canonical list address will be linux-kernel-mentees@lists.linux.dev.

2. *The old address will continue to work* for the foreseeable future, so any
   existing conversations can continue and any new messages sent to the old
   list address will be properly delivered to all subscribers.

3. All members will be automatically subscribed to the new list, so no action
   is required on anyone's part to keep receiving list mail.

4. The archive on https://lore.kernel.org/linux-kernel-mentees/ will be
   automatically updated to track the new list address.

5. The List-ID header will change, regardless to which address the message is
   sent:

   before: List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
    after: List-Id: <linux-kernel-mentees.lists.linux.dev>

   You will need to update your filtering rules if you filter based on the
   contents of that header (on or after November 7).

6. The mailman footer will no longer be added to message bodies.

7. Subscribing and unsubscribing will be done using the mlmmj supported
   commands, documented at https://subspace.kernel.org/subscribing.html

Please let me know if you have any questions or concerns. Otherwise, I will
follow up on November 7 after the move has been completed.

Best regards,
-K
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
