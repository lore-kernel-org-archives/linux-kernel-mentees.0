Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B1BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 22:02:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A3D20706
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 22:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A3D20706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1C408798A;
	Mon, 24 Aug 2020 22:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZUBvKo3rcfs; Mon, 24 Aug 2020 22:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68F6B8796D;
	Mon, 24 Aug 2020 22:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58C17C07FF;
	Mon, 24 Aug 2020 22:02:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFBCFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 22:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BA16B8771B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 22:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xUEMh79XznF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 22:02:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 70A9D86BAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 22:02:44 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C476A2CB;
 Mon, 24 Aug 2020 22:02:43 +0000 (UTC)
Date: Mon, 24 Aug 2020 16:02:42 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20200824160242.58e30685@lwn.net>
In-Reply-To: <20200812180224.24810-1-puranjay12@gmail.com>
References: <20200812180224.24810-1-puranjay12@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Fpga: Documentation: Replace
	deprecated :c:func: Usage
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

On Wed, 12 Aug 2020 23:32:24 +0530
Puranjay Mohan <puranjay12@gmail.com> wrote:

> Replace :c:func: with func() as the previous usage is deprecated.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
>  Documentation/driver-api/fpga/fpga-bridge.rst  |  6 +++---
>  Documentation/driver-api/fpga/fpga-mgr.rst     |  6 +++---
>  .../driver-api/fpga/fpga-programming.rst       | 16 ++++++++--------
>  Documentation/driver-api/fpga/fpga-region.rst  | 18 +++++++++---------
>  4 files changed, 23 insertions(+), 23 deletions(-)

Applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
