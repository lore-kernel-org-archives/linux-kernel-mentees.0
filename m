Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873C3C6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 12:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC5B61353
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 12:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC5B61353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A8540526;
	Thu, 22 Jul 2021 12:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJRQ_MvVC3vv; Thu, 22 Jul 2021 12:34:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 190F04051D;
	Thu, 22 Jul 2021 12:34:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04F22C001A;
	Thu, 22 Jul 2021 12:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F05D5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1CDD40523
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eVd8kR3lf46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:34:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AAB74051D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1626957249; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cF3NV3KAt29Sf/rMRYrYN9ooiXFU1Qbo7JUHgJN/GvabycyU5bclL3r+qCJyJTdt+gFl9AHMfsD7ymMusAXaNcFnn6truGqIJ5JSNn7nAgpT/aof9VzN6O3Nu+rsKxXwq1g2RKt6uF3fr20asZ20wOzOpv3pwZLT+Yi8XAt3fvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1626957249;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=+xjmJsGh9HKYxZlwI9c52nF61hk9sjd0HiYWIidswWo=; 
 b=jUj7qjYgHdjH1m3IJhKu+23Gb31bx1cdoRx4RAoY3GzCbpPTYUPwYaWTvyx4MEv5yh4cGu+g2npFQbrfTydCNQEspHywGwx3x+A8qgqGVTMq2d931u+GjQIVvu00ft+T9hMl5LsakDt7uXwVzKQnNZC9o9bTcI4E5sjTIrysdS8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626957249; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=+xjmJsGh9HKYxZlwI9c52nF61hk9sjd0HiYWIidswWo=;
 b=dz016In0RTp7PJg4W0TGYUBYuTNtaTt8TY4v+GSkHnhq5A8JGuCX0el6UcueiXjY
 wk2NvZfsRihFoq/77i7Ii+bgOXyc1pBztUrmi8CDyMuHlcXxeoxrndGrmVJmsJdyXsR
 +OKXQoXSqeJsw4G+6ubs4QViRNOBAgH5AO0nLpxg=
Received: from anirudhrb.com (49.207.63.174 [49.207.63.174]) by mx.zohomail.com
 with SMTPS id 162695724585718.164515886124036;
 Thu, 22 Jul 2021 05:34:05 -0700 (PDT)
Date: Thu, 22 Jul 2021 18:03:59 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 1/2] firmware_loader: use -ETIMEDOUT instead of
 -EAGAIN in fw_load_sysfs_fallback
Message-ID: <YPlltzyc+hgq51u3@anirudhrb.com>
References: <20210721190014.2313-1-mail@anirudhrb.com>
 <20210721190014.2313-2-mail@anirudhrb.com>
 <CAB=NE6UbB0VT+CZ0aD140LSj6DvRs==_GMxJ=isj30idnStbfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=NE6UbB0VT+CZ0aD140LSj6DvRs==_GMxJ=isj30idnStbfQ@mail.gmail.com>
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Jul 21, 2021 at 12:14:37PM -0700, Luis Chamberlain wrote:
> But the patch still keeps it, please remove the -EAGAIN setting completely.

Oops, my bad! Sent a new version.

	- Anirudh.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
