Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD3EE4993
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Aug 2023 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4E241741;
	Wed, 23 Aug 2023 14:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD4E241741
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O/7IdDqg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNdyYwYaj-BO; Wed, 23 Aug 2023 14:16:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8CD1741703;
	Wed, 23 Aug 2023 14:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD1741703
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71E33C0071;
	Wed, 23 Aug 2023 14:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 074AFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 14:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C283A60F03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 14:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C283A60F03
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=O/7IdDqg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRtZy0CIikg5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 14:16:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D1E460E5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 14:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D1E460E5D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E572E65B49;
 Wed, 23 Aug 2023 14:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B95C433C8;
 Wed, 23 Aug 2023 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692800186;
 bh=DwblRXD6m9eIyN8zoYD7uuOYKE0IACRN+MXuDnwh9FM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=O/7IdDqg83TzmzT2Xyv8WFenhvoYt95gTfhv7jrSe4hrMFQpZRh9cRbZOya4N2Nrn
 6k+vDISw6wis98y8w9azDrmV1DgtjwYD9/LgywIQ68iSeAB7N2M2syj/u94lvVJDzH
 89A3zMDaLDpO3lqHUtMUctIEItctTBratk4onh744T593Gi6N6sQLi+epV2ZgU/mR+
 GVgwM2jOPTUXdgzy9FxTB10mnMvIYkR2iBH1k8SVQtrMhhAv7BnP2kMzN6vZrzNsxi
 oliTIGa/ZnXVDwgwJ3pVEp5zXSRkH6xxa7PdzkmR0U3cackoxwoNPJh0qccH/mBYF+
 pdzlHkbdxWDHA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath5k: fix WARNING opportunity for swap.
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230815040819.649455-1-mahmoudmatook.mm@gmail.com>
References: <20230815040819.649455-1-mahmoudmatook.mm@gmail.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169280018252.1336947.9195494625523438821.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:16:24 +0000 (UTC)
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, mickflemm@gmail.com,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, jirislaby@kernel.org
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

Mahmoud Maatuq <mahmoudmatook.mm@gmail.com> wrote:

> coccinielle reported the following:
> ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()
> 
> while trying to fix the above warning, it reveals that ath5k_hw_get_median_noise_floor()
> had open-coded sort() functionality. Since ath5k_hw_get_median_noise_floor() only
> executes once every 10 seconds, any extra overhead due to sort() calling
> its "compare" and "swap" functions can be ignored, so replace the
> existing logic with a call to sort().
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e10ec6ea612c wifi: ath5k: ath5k_hw_get_median_noise_floor(): use swap()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230815040819.649455-1-mahmoudmatook.mm@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
