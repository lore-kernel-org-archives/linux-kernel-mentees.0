Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D1CC5479A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EE360C2C;
	Thu, 17 Aug 2023 20:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08EE360C2C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=spITFcVV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NCuSIQKFwaF; Thu, 17 Aug 2023 20:57:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2429D60A4F;
	Thu, 17 Aug 2023 20:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2429D60A4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0079FC0039;
	Thu, 17 Aug 2023 20:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30950C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 20:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A3242204
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 20:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A3242204
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=spITFcVV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6M-l_uvInY6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 20:57:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F384942200
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 20:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F384942200
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30341612EE;
 Thu, 17 Aug 2023 20:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FB8C433C7;
 Thu, 17 Aug 2023 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692305843;
 bh=Cz0bpZIHuJ97+/eXABSNnd6abp7icCo53irEIi6xom8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=spITFcVVlHEtmVsTgC3Q31Ykp2iku/xtv5XwL1pBcBZOIbV6UX0oi4KQqbLDl11bL
 GFiayMB2cNx8kAXVwgTaO85j3Ipesr1hy0pLVSjc3oxfXy7Y0KznBwx8HToLd808JR
 jTFpzG8LG1703IDEWF3JL1eEqiKrErC93xyMwbOo=
Date: Thu, 17 Aug 2023 22:57:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ram Kishore Vegesna <ram.vegesna@broadcom.com>
Subject: Re: [PATCH v2] scsi: sli4: Remove the buggy code
Message-ID: <2023081755-virus-showman-f3b2@gregkh>
References: <20230817103751.16350-1-coolrrsh@gmail.com>
 <20230817105252.GA14370@yadro.com>
 <CAF7aS0rrZvZK_bE21Umrr+RAGgQB6-qDdoqSPnKh6f7HcX8Ovw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF7aS0rrZvZK_bE21Umrr+RAGgQB6-qDdoqSPnKh6f7HcX8Ovw@mail.gmail.com>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
 rdunlap@infradead.org, james.smart@broadcom.com, linux-kernel@vger.kernel.org,
 target-devel@vger.kernel.org, Dmitry Bogdanov <d.bogdanov@yadro.com>,
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

On Thu, Aug 17, 2023 at 06:03:32PM +0530, Ram Kishore Vegesna via Linux-kernel-mentees wrote:
> -- 
> This electronic communication and the information and any files transmitted 
> with it, or attached to it, are confidential and are intended solely for 
> the use of the individual or entity to whom it is addressed and may contain 
> information that is confidential, legally privileged, protected by privacy 
> laws, or otherwise restricted from disclosure to anyone else. If you are 
> not the intended recipient or the person responsible for delivering the 
> e-mail to the intended recipient, you are hereby notified that any use, 
> copying, distributing, dissemination, forwarding, printing, or copying of 
> this e-mail is strictly prohibited. If you received this e-mail in error, 
> please return the e-mail to the sender, delete it from your computer, and 
> destroy any printed copy of it.

Now deleted.

(hint, this footer is not compatible with kernel development, please fix
your email system...)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
