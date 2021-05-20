Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F49BC43462
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 03:58:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9FE60FDC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 03:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D9FE60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158966079C;
	Thu, 20 May 2021 03:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AU-Zxt0XAxPM; Thu, 20 May 2021 03:58:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 402C960625;
	Thu, 20 May 2021 03:58:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 193C7C000E;
	Thu, 20 May 2021 03:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41C73C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 03:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2627C83B88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 03:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooiX-NHvMUBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 03:58:04 +0000 (UTC)
X-Greylist: delayed 18:41:38 by SQLgrey-1.8.0
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn
 [202.108.3.164])
 by smtp1.osuosl.org (Postfix) with SMTP id 94E9C83926
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 03:58:04 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.199.207.228])
 by sina.com (172.16.97.35) with ESMTP
 id 60A5DD030001E6D1; Thu, 20 May 2021 11:52:38 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 17988115073761
From: Hillf Danton <hdanton@sina.com>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v4] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Date: Thu, 20 May 2021 11:52:28 +0800
Message-Id: <20210520035228.1537-1-hdanton@sina.com>
In-Reply-To: <YKVfTKkxrn72TDqe@anirudhrb.com>
References: <20210518155921.4181-1-mail@anirudhrb.com>
 <20210519091047.1477-1-hdanton@sina.com>
MIME-Version: 1.0
Cc: syzbot+de271708674e2093097b@syzkaller.appspotmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Junyong Sun <sunjy516@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, 20 May 2021 00:26:12 +0530 Anirudh Rayabharam wrote:
>On Wed, May 19, 2021 at 05:10:47PM +0800, Hillf Danton wrote:
>> 
>> Fine, apart from what you are fixing, you are adding something like
>> finish_wait() into the waker's backyard. Why are you calling
>> complete_all() on the waiter side?
>
>Sorry, I don't really get your point here. I did not add complete_all().
>It was already there. Could you please elaborate?

If a simple pattern works for you,

 	mutex_lock(&fw_lock);
 	list_add(&fw_priv->pending_list, &pending_fw_head);
 	mutex_unlock(&fw_lock);

	retval = fw_sysfs_wait_timeout(fw_priv, timeout);

 	mutex_lock(&fw_lock);
	list_del_init(&fw_priv->pending_list);
 	mutex_unlock(&fw_lock);

	device_del(f_dev);
	put_device(f_dev);
	return retval;

add a followup cleanup to cut off the list_del on the waker side instead of
putting a spanner in their work that is completing all waiters.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
