Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF9C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 06:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0778F402BC;
	Mon, 31 Jul 2023 06:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0778F402BC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=h9Xd/lU1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kPcuabCP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31KmP0egG_iL; Mon, 31 Jul 2023 06:15:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D3D2B4029B;
	Mon, 31 Jul 2023 06:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D2B4029B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2AE8C0071;
	Mon, 31 Jul 2023 06:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01305C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A21402BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A21402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfuKFmkhqOsa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:15:48 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0C614029B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C614029B
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D81695C0114;
 Mon, 31 Jul 2023 02:05:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 Jul 2023 02:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1690783556; x=1690869956; bh=n2
 wRoW24j0gLnWuzE6UjK8lJLJEmTRp50vltai64yVg=; b=h9Xd/lU1jK78dcBIAL
 zNwwR1IP3iGnPs+iGlOKE2ryAQ9BbRcrM71HjAgMRuo9lOHsoizmURDU+mThE1O5
 caa5ScNbLRcGXMvnIMW4o6h1/v9yxtVMqKFDLj1I+9TkaBwoXQI2uhEG9AYPlBJl
 Q0qrLmm5hzSxXPjD2m+kxkYPkAXNLPQpXKQbY4b9Xz5HhsZjCZBRu8A0yBIx+nIZ
 3qthTJ9UF1Q2SMNluiw/85eBmO5stBLtbSFe5AFhtKv3H2gf637BOhuvXsvGa8CA
 tc/Qu1Ktc4prMZjhDNMZ/ujAPnWpp/9jn66yW8OCDH50xrLUrhLTvh7gi6ymEnpU
 f5cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690783556; x=1690869956; bh=n2wRoW24j0gLn
 WuzE6UjK8lJLJEmTRp50vltai64yVg=; b=kPcuabCPpEFRWBS96eZKgi+DQp1/Y
 crhFUquo8BHzGW4z8zfIuT7b7/vufTnBGhOdH/XOrf6mHgwznzwV4jSL0LCRTcF8
 VVj+Vuz1p8zlT3rnP0+xc4z17LWUE5vhAQwJ1XnmPYBGI1TA/Z0+AlNsLLmLRzEP
 nKm2PArS5X7jLg2gZSrWA7cJYQ7JvqEBjZvW/x5RryRQ/zOqigjD3wFPGjjIn3hK
 iPVN7TuBbXplL6l/+WDaVwmmaYXmZF7Z5a7N6+liO1himXO6mlXFlYlTzGA6ZKNr
 /gC+1IHb1G4jMUwxJsxjcGrxCVq16trI63RvV9Dw+C9K23Cyssu7/xzjQ==
X-ME-Sender: <xms:RE_HZL9MKCCz0CmQ1-QJcAh2kSmMoeSXx0jMfT42RNs5B_vsWKjx2Q>
 <xme:RE_HZHtjJpAP-rI6quB-LYUG3zlro6sIm_PnNOYuMsqI7p_BjKwDpdsRETsaJZG4E
 5uZnBfAUHEv-Q>
X-ME-Received: <xmr:RE_HZJA1fTQzrsdMytRKA-BX8JPbhNBZ3ugFXwlZUBc6uI1_QzIYMlGPyFOz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjedvgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgeehue
 ehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeelvedttddvnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:RE_HZHeaEl2SxRzBA6BlogEs0vpV8IMpgYy69KYrRNTw93exNz0Dfg>
 <xmx:RE_HZANzqisCuUImHxKoybeFLY-za0s0VFRIwSyPuFgyohdjATR-3w>
 <xmx:RE_HZJlGktx1xbG8sIdCmWfFZU4RO6pydQa9JRSOL2IUBnxwpxHBcA>
 <xmx:RE_HZBiiJMs5YIxiLlN9H5Pa8Bh-QgFz6ItDn3-vK4HJO-8CamBsYA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jul 2023 02:05:56 -0400 (EDT)
Date: Mon, 31 Jul 2023 08:05:52 +0200
From: Greg KH <greg@kroah.com>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH] ath6kl: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <2023073103-basket-ranking-b6e6@gregkh>
References: <20230731012941.21875-1-rauji.raut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731012941.21875-1-rauji.raut@gmail.com>
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Sun, Jul 30, 2023 at 06:29:41PM -0700, Atul Raut wrote:
> Because zero-length arrays are obsolete, replacing them with
> C99 flexible-array members.
> Instead of defining a zero-length array, use the new
> DECLARE_FLEX_ARRAY() auxiliary macro.
> 
> This fixes warnings such as:
> ./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> ---
>  drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
> index 5220809841a6..bb3771a3897c 100644
> --- a/drivers/net/wireless/ath/ath6kl/usb.c
> +++ b/drivers/net/wireless/ath/ath6kl/usb.c
> @@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
>  	__le32 cmd;
>  	__le32 address;
>  	__le32 value;
> -	__le32 _pad[1];
> +	DECLARE_FLEX_ARRAY(__le32, _pad);

This is not a 0 length array, or a variable array.  Look at the work
done on the hardening mailing list for more details, I think this is
wrong.

good luck!

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
