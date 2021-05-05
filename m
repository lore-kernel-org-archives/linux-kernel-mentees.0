Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594B7C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 05:09:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15F56054E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 05:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15F56054E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D3F605EA;
	Wed,  5 May 2021 05:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tW2ulpO1UmxC; Wed,  5 May 2021 05:09:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1937605CB;
	Wed,  5 May 2021 05:09:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99B09C000D;
	Wed,  5 May 2021 05:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52078C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 05:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA56605EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 05:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8tktitDaBFa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 05:09:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B13A605CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 05:09:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8E3F6139A;
 Wed,  5 May 2021 05:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620191350;
 bh=LuXvMh9OAQMZ5WSlcpBP+5OSpKgDdJd3fhAbEqwnYm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TN7Kzguuea+F6RPVLfPfsi5qD7LY074qQZl3gpUSmXMaUJds2Hiu4HlvMwkTYuZry
 Df5UbTgcqFjs2xqZWXWznJskUvRUNFGWBsYAmASn7nd8Wb4q6d4RdPZP3Bftyy5gpR
 Ygp1QWfpeFIx1cDxsvlP643q72AeaYYxCPOacRGg=
Date: Wed, 5 May 2021 07:09:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlos Eduardo Climaco Barbosa <barbosa.carlos.ec@gmail.com>
Subject: Re: [Bug Fixing] Interest in Mentorship - Summer 2021: Carlos Barbosa
Message-ID: <YJIocgBelI0E5oCV@kroah.com>
References: <CALBj8qfcCj8BA4VtoKmdnumGV4sHg99tccZuFV0fArBns-Eskg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALBj8qfcCj8BA4VtoKmdnumGV4sHg99tccZuFV0fArBns-Eskg@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, May 04, 2021 at 05:24:25PM -0300, Carlos Eduardo Climaco Barbosa wrote:
> I soon intend to officially apply through the LFX site, but I must
> update my CV first.

Please apply through the site, that's how to get started.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
