Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C44C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 06:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9A46133C;
	Thu,  3 Aug 2023 06:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9A46133C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i/o2o8dF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_ijagYOhNWJ; Thu,  3 Aug 2023 06:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6588F6130B;
	Thu,  3 Aug 2023 06:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6588F6130B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F02FC0071;
	Thu,  3 Aug 2023 06:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B589C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 06:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB93612E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 06:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB93612E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6ID2F5yXocp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 06:05:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68E3461330
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 06:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E3461330
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44DB461BCB;
 Thu,  3 Aug 2023 06:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B82C433C8;
 Thu,  3 Aug 2023 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691042738;
 bh=WZTFoVHcGeMmalzByxFyx7Fz4svVAt6JNaj6xq40gBQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=i/o2o8dFGsGjnQXVMP5YG/uLnZFrELKMI3syPiEHRsJ6Vft4oFTwK+hseKfHiujD3
 y2vhYx5UZj7jW2YTYmXQAkjAXRPnGjCsIpzJUoE0h26tEgXaxOSB9EplqlsojLECdW
 djSb8ta/PwH+AYWjgS6nRqY6aKzGkohazUJrix3QezuunKs5nywtxoR41yyVw1vfyA
 HMIaXUd8sKeOmkgof6ve/k7WNhY5H+dc6uPYQdoYFgBhgG33yVb0REGQNOqTXXW615
 nLmIJ4vHyV9pV102vzjTwqQFXeOyxkLyz6fKjwM/RZi1ENdDseYzGHhHvYlBPAUr2p
 JHczCFRlsMtog==
From: Kalle Valo <kvalo@kernel.org>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH v2] brcmfmac: replace one-element array with
 flexible-array member
References: <20230803052238.12147-1-rauji.raut@gmail.com>
 <20230803052238.12147-2-rauji.raut@gmail.com>
Date: Thu, 03 Aug 2023 09:05:35 +0300
In-Reply-To: <20230803052238.12147-2-rauji.raut@gmail.com> (Atul Raut's
 message of "Wed, 2 Aug 2023 22:22:38 -0700")
Message-ID: <874jlgvexc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, aspriel@gmail.com,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 franky.lin@broadcom.com
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

Atul Raut <rauji.raut@gmail.com> writes:

> One-element arrays are obsolete, and flexible
> array members have taken their place. So, in
> struct cca_stats_n_flags, replace the one-element
> array with a flexible-array member.
>
> This fixes warnings such as:
> ./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9:
> WARNING use flexible-array member instead
> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

I have now three patches from you in queue:

https://patchwork.kernel.org/project/linux-wireless/patch/20230731011635.20993-1-rauji.raut@gmail.com/

https://patchwork.kernel.org/project/linux-wireless/patch/20230803052238.12147-1-rauji.raut@gmail.com/

https://patchwork.kernel.org/project/linux-wireless/patch/20230803052238.12147-2-rauji.raut@gmail.com/

v1 submitted twice and v2 without any change log. Please read the
documentation from our wiki link below how to submit patches.

Also I would like to have a review from someone else before I consider
taking this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
