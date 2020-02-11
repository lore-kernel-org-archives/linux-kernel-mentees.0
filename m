Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FF9C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 19:27:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E7720637
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 19:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQY4Mmpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76E7720637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D42285D55;
	Tue, 11 Feb 2020 19:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCxfybnwQvsQ; Tue, 11 Feb 2020 19:27:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4CC485D50;
	Tue, 11 Feb 2020 19:27:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC50EC1D88;
	Tue, 11 Feb 2020 19:27:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AD24C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 19:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EDB3285005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 19:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJkxXSyq60Gz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 19:27:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9240B84EC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 19:27:02 +0000 (UTC)
Received: from localhost (unknown [104.133.9.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5674C20873;
 Tue, 11 Feb 2020 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581449222;
 bh=d9iTIU7z0h/UAxXemQIRG88N34pgT887tmSXs635Ibg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQY4MmpobVgaVaTP6qsCiIjySAMLzVQE3jZ/E5xMAk1pJ+Ut1QYPMb+tUrg73yxuB
 GP57yThJgV+rPR8Mpxl7iG7GB/bm5HksdTaptyuDfR1AydFmBQs8QgO6uEqvLly+VS
 W21zUBINJu/dqV0oI3gZqdmbZnG0pVVHo4lh7JYk=
Date: Tue, 11 Feb 2020 11:27:01 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200211192701.GA1971434@kroah.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
 <20200211123859.10429-2-pragat.pandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211123859.10429-2-pragat.pandya@gmail.com>
Cc: valdis.kletnieks@vt.edu, devel@driverdev.osuosl.or,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 01/18] staging: exfat: Rename
 function "ffsUmountVol" to "ffs_umount_vol"
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

On Tue, Feb 11, 2020 at 06:08:42PM +0530, Pragat Pandya wrote:
> Fix checkpatch warning: Avoid CamelCase
> Change all occurrences of function "ffsUmountVol" to "ffs_umount_vol"
> in the source.

I've said this before about this type of change, but there's no need for
the "ffs" prefix at all for almost all of these functions.  Can you just
name them sanely instead?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
