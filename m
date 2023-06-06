Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8AFC7EE2F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jun 2023 13:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8EB61207;
	Tue,  6 Jun 2023 13:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E8EB61207
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=mUZRpAjz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsJ73taQnFxO; Tue,  6 Jun 2023 13:56:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A5ED660F58;
	Tue,  6 Jun 2023 13:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5ED660F58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FA9AC0037;
	Tue,  6 Jun 2023 13:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 282F3C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 13:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E889F81D35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 13:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E889F81D35
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz
 header.a=rsa-sha256 header.s=default header.b=mUZRpAjz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxGGx4rEY6gl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 13:56:38 +0000 (UTC)
X-Greylist: delayed 00:05:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24C881CE9
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D24C881CE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jun 2023 13:56:37 +0000 (UTC)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 00E4011D5;
 Tue,  6 Jun 2023 15:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 00E4011D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1686059445; bh=inf9czf+Fxft+0nBooxISAuEFReZinVPBtqDt/EIdoQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mUZRpAjzEIWL/Y6XLYQjIKsPJfvecZuVjnU7H5955AKOjs5pvEu3XBlIEOuxX/PGF
 05934txPHJYUIfplC71NAXLaHSGjDM7GI3aZIpGGVneL5K4nHYjutVhLlgINMvzLze
 NeWQq6BD6/njYHApvWVsDPmWICBfN4Ybj2918PO0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  6 Jun 2023 15:50:32 +0200 (CEST)
Message-ID: <d0be2139-0dae-158b-2760-ab62080b73ba@perex.cz>
Date: Tue, 6 Jun 2023 15:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/3] docs: sound: add 'pcmtest' driver documentation
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com, corbet@lwn.net,
 broonie@kernel.org, skhan@linuxfoundation.org
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 06. 06. 23 15:38, Ivan Orlov wrote:
> Add documentation for the new Virtual PCM Test Driver. It covers all
> possible usage cases: errors and delay injections, random and
> pattern-based data generation, playback and ioctl redefinition
> functionalities testing.

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
