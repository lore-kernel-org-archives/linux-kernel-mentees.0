Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC4C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399D282081;
	Tue,  8 Aug 2023 19:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399D282081
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HC9tZ1Qt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFIZ0XUmFDVu; Tue,  8 Aug 2023 19:43:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B17482001;
	Tue,  8 Aug 2023 19:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B17482001
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13E41C0071;
	Tue,  8 Aug 2023 19:43:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 536A7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 19:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9D082081
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 19:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9D082081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCf6GMmpqAkl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 19:43:06 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D9D82001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 19:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D9D82001
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84d8bso18046775e9.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691523783; x=1692128583;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOolvKmjNbA3psrGMAp+3ipqqGdZ/BVnezDxpZWH8ms=;
 b=HC9tZ1QtSi5ORdON+XMHnl2vCZ6cJogJ8xaGHcBU0vDyWWpj9nX+I8TxYJ0iBuqeAs
 0KjHFKewwDIkng9wdW7Z9W0q7murFn3rqAHU9n40ahS3m5Hga3FlZsa7aN2hSziKE/E+
 ielv5q6faWE7fRi0aovuTUAEGAIKaByelW2Lq6b4BxJEIhJpqlNBiW4+ng7uJnh5dLLe
 njufyxgs9w+y/4MCEWbhprLvcQz71kzfXI7og601cU7QmPGzzgW/XaT6K8JJ5TF7nvu+
 epUjRvgm6+00D2argBvHWJrLPUrdlfJay1W8CMfmaMkrSwzqWksI7/X5rXM+iccb2ost
 gSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691523783; x=1692128583;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cOolvKmjNbA3psrGMAp+3ipqqGdZ/BVnezDxpZWH8ms=;
 b=S9ud/2NjMVv4/J2/T659m4SiE0R6/GXYe5tOWgOCHdFCX/NO8H2EtsW4dHZEXODSCw
 JgyDdDO5mnINiTRzs3G8wZmEeq28NI1QZoQ7U58dxrh5yiSbxoNxcXzZEDRDBSONo8rm
 X/P1bXZZdxKsn1nCMm+uGgVw3g+XnabwGXOhYk2JJrI+mMsP1BiP36UZ2NlqDLuDBuya
 IgCDq9QBXWSRUKMirMhJ9DjRyRNxEFvL/k+6e1yT+jn0H2wosbPDBL/NlpzSCq+0fyzp
 FrdZzEiO+EPkKMb3DySVjYNNBjHtLvCgF06/QP8DnTF3sO3IVh/1+iEnDDGFj+n4eTTE
 20uw==
X-Gm-Message-State: AOJu0Yz4tefuuSLehKaC1prDJfUl8Gr5RPvOyjHeR/IV1KJYlxGHjkr0
 AZDvTu4xOEZZNCaepBgiM48=
X-Google-Smtp-Source: AGHT+IH63RiCGVaJ+XGcErXY3rfQFL9fz6CdslQk4F3i+XRxMUcLBRkelsoaCKiCvoxb6Qp1HbLTJw==
X-Received: by 2002:a05:600c:2215:b0:3fc:5a3:367c with SMTP id
 z21-20020a05600c221500b003fc05a3367cmr621098wml.32.1691523783245; 
 Tue, 08 Aug 2023 12:43:03 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:15aa:8c5a:b813:cec2:4273])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a7bcb54000000b003fbfef555d2sm19090487wmj.23.2023.08.08.12.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 12:43:02 -0700 (PDT)
Date: Tue, 8 Aug 2023 23:42:58 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] ath5k: fix WARNING opportunity for swap.
Message-ID: <20230808194258.ocxnmqwzqlr6jpe4@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: Jiri Slaby <jirislaby@kernel.org>, mickflemm@gmail.com,
 mcgrof@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
 <92a26f67-1b24-ea35-2f39-7c0b75027617@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92a26f67-1b24-ea35-2f39-7c0b75027617@kernel.org>
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, mickflemm@gmail.com,
 mahmoudmatook.mm@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On 08/08, Jiri Slaby wrote:

> On 07. 08. 23, 22:10, Mahmoud Maatuq wrote:
> > coccinielle reported the following:
> > ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()
> 
> 
> OK, once again:
> https://lore.kernel.org/all/0c3acbd4-6ab2-5cc5-6293-54e30093cce2@kernel.org/


I had a look at the commit history, to see why the original developer 
didn't use sort() function, and name the array variable sort but found
nothing. 
I have some doubts that he might did that intentionally, so not to call
sort() function for such small array and avoid the cost of context
switching.


> > Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> > ---
> >   drivers/net/wireless/ath/ath5k/phy.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
> > index 5797ef9c73d7..f87eb684f223 100644
> > --- a/drivers/net/wireless/ath/ath5k/phy.c
> > +++ b/drivers/net/wireless/ath/ath5k/phy.c
> > @@ -1562,16 +1562,13 @@ static s16
> >   ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
> >   {
> >   	s16 sort[ATH5K_NF_CAL_HIST_MAX];
> > -	s16 tmp;
> >   	int i, j;
> >   	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
> >   	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
> >   		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
> >   			if (sort[j] > sort[j - 1]) {
> > -				tmp = sort[j];
> > -				sort[j] = sort[j - 1];
> > -				sort[j - 1] = tmp;
> > +				swap(sort[j], sort[j - 1]);
> >   			}
> >   		}
> >   	}
> 
> -- 
> js
> suse labs
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
