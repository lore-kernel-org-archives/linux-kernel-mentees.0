Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505E3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Dec 2021 13:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A49404E7;
	Sat, 25 Dec 2021 13:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWv69Ro2uXtB; Sat, 25 Dec 2021 13:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B7FE840166;
	Sat, 25 Dec 2021 13:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92EC9C002F;
	Sat, 25 Dec 2021 13:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15EA1C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Dec 2021 13:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFCCF401C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Dec 2021 13:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bF1W1duA507
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Dec 2021 13:37:20 +0000 (UTC)
X-Greylist: delayed 00:06:18 by SQLgrey-1.8.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83BFE40166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Dec 2021 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1640439440;
 x=1671975440; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s9lf9e/EduDxiaQQMklUM5VPoyo3fHkdFdUfVg0nmFY=;
 b=ZaIMWsd0RF1hGg2kh5I0capCae7kcaqpcjKjNgMAhk+grBELyYI4CF5S
 5/3j4/zaYYnPjlJbK38oN/1gN3gbbjWs2ikhXA2Ad8E/TuPsU3NIGpJTt
 iOOtFTVpKZD2jG8Ax1rvCbrSQaEUd7/QgkxuQz+dhUH9nZDVE1L2aHVIO
 Tg/nGkE9mtP5Eo9ko5mmoODRViUe2t3T5EkkygdKfsBkJ6k3LqEQttoch
 xKhHfEVB+xDYxSbdhRAo72xZNjuqcT+4bpvhbgY036dOPuW5XrBlm2d+0
 uFWJ1obezLK4c/CEhy4MAetO9TN5gp0ddkcG6bb3NpexxZQxXpvvTGevk w==;
Date: Sat, 25 Dec 2021 14:30:57 +0100
From: Jesper Nilsson <Jesper.Nilsson@axis.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 02/23] PCI: artpec6: Prefer of_device_get_match_data()
Message-ID: <20211225133057.GN5179@axis.com>
References: <20211223011054.1227810-1-helgaas@kernel.org>
 <20211223011054.1227810-3-helgaas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223011054.1227810-3-helgaas@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, Jesper Nilsson <Jesper.Nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@axis.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Fan Fei <ffclaire1224@gmail.com>
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

On Thu, Dec 23, 2021 at 02:10:33AM +0100, Bjorn Helgaas wrote:
> From: Fan Fei <ffclaire1224@gmail.com>
> 
> The artpec6 driver only needs the device data, not the whole struct
> of_device_id.  Use of_device_get_match_data() instead of of_match_device().
> No functional change intended.
> 
> [bhelgaas: commit log]
> Signed-off-by: Fan Fei <ffclaire1224@gmail.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Looks good to me,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Cc: linux-arm-kernel@axis.com

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
