Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06CAC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 09:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 760B141C7F;
	Fri,  5 Aug 2022 09:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760B141C7F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=ousbkyXk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjMY8kHlA9YN; Fri,  5 Aug 2022 09:35:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8CFCA40510;
	Fri,  5 Aug 2022 09:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CFCA40510
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65829C0033;
	Fri,  5 Aug 2022 09:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCBE9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B717982A87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B717982A87
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=ousbkyXk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPz4Ek3dd5gc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537468125B
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 537468125B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659692131; cv=none; d=zohomail.in; s=zohoarc; 
 b=HGNHEpDjMnxaaLGavAkDCfW+6RNU+cbd0+prbhfC1fJJ/1gZ2fUBaTW/OWb2QXvudVNlZWU6C1g3xgcc6mkWplLCckC4GHkxH03B4omSPvRjBmwpMgeuSdv8t1qze5uyjaL+RVt3oghdPRXB8lkxv1FEHMmX+AUvcdezuIiGb80=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659692131;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=f8615EGDWe44tvsYPbzBo/6/jTmVu1y7l7Pkq6Q/1Ig=; 
 b=LZADhVL2AimiA6NVc+Mn6E9OASVriJ3j5k8pYPe/+uFKy71X+4KbEZ339kmNqlDxhaq/O1piNnLpSQVjHtO6eEXdC7i+KXuxfTAXd6orpMDG4Ds8Y5CcLf9OTRsvC6WRcrT//9+LhjnGcaLdiS6EJuu/H7LXPkXPtee5rCLdNWU=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659692131; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=f8615EGDWe44tvsYPbzBo/6/jTmVu1y7l7Pkq6Q/1Ig=;
 b=ousbkyXkFzhAdKxN9NaAT/r1huPDwRekH4obymiGGeZWZKDOtdYxWT82xMxwyOKs
 hVB38twxtCHvlvCyAyUErrm5/J4r/zV64ILwDbVjsBrIE70BvFM85GZaL29Atf1AYfX
 LMQHhjPoYO4tt/FJWr20x7t34VhxXM3bVt5DoDSo=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659692119211186.6606668834628;
 Fri, 5 Aug 2022 15:05:19 +0530 (IST)
Date: Fri, 05 Aug 2022 15:05:19 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <1826d5bf492.4777e628118669.6994537284529152343@siddh.me>
In-Reply-To: <YuzDwa4otHkImo10@sol.localdomain>
References: <cover.1659618705.git.code@siddh.me>
 <YuzDwa4otHkImo10@sol.localdomain>
Subject: Re: [PATCH 0/3] kernel/watch_queue: Clean up some code
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 05 Aug 2022 12:46:17 +0530  Eric Biggers  wrote:
> I think patches 1 and 3 should be merged together.
> 
> Also, please use a consistent version number for all patches in the series.  You
> have a version 1, version 2, and version 4 patch all in the same series, which
> is very confusing.
> 
> - Eric
> 

Will do.

Sorry for the confusion.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
