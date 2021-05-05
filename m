Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F1AC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 12:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7478F61132
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7478F61132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DDB40F51;
	Wed,  5 May 2021 12:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSq8BRVoIiOI; Wed,  5 May 2021 12:42:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F2640EFA;
	Wed,  5 May 2021 12:42:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF181C000D;
	Wed,  5 May 2021 12:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33C55C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 12:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF5783EC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 12:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnPC9O8zK9Ch
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 12:42:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FE9F83EBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 12:42:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D9961132;
 Wed,  5 May 2021 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620218563;
 bh=j5tgY7P6UNnRgnZwcKAWN+v013/tjXzDMOOa52v8hj0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mc/IuCu2Pq6OzFcuAyZMNnqZZRpLxI98AEaW+RhjjNP9s0ypSX22cyZKHka2UXzp8
 RDuOVBCrEDB3O0c+NdE3VVG95tkWkZfmWzGvrh4iL84BoqpoW+TltKoSGK0+l9Pqhl
 O2q0Sg3kPP1IBWtXLp7QEn5jB9JzOBVNuz4cMzX/Z3qtyveL+Ke+LvuLTI1+38Vrtr
 +3mynjLXY+FFm3YjF1xj4Oe9lxjzi+MZLnqfghvrjeb9a8l1KZtGt8aPy9vfCM2evb
 0pj4/Y3p38j6I76Y/3gukTYVfBbCH7DSUB4l1nYN6g4n9c+fRAbdOf3Elajq4unGeE
 nvRxGtJeY7jkw==
Date: Wed, 5 May 2021 14:42:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
In-Reply-To: <20210425173353.10231-1-mail@anirudhrb.com>
Message-ID: <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
References: <20210425173353.10231-1-mail@anirudhrb.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, 25 Apr 2021, Anirudh Rayabharam wrote:

> In hid_submit_ctrl(), the way of calculating the report length doesn't
> take into account that report->size can be zero. When running the
> syzkaller reproducer, a report of size 0 causes hid_submit_ctrl) to
> calculate transfer_buffer_length as 16384. When this urb is passed to
> the usb core layer, KMSAN reports an info leak of 16384 bytes.
> 
> To fix this, first modify hid_report_len() to account for the zero
> report size case by using DIV_ROUND_UP for the division. Then, call it
> from hid_submit_ctrl().
> 
> Reported-by: syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Benjamin, could you please run this one through your regression testing 
machinery before we send it upstream?

Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
