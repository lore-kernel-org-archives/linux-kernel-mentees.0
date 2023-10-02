Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE888E748FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D49B60B21;
	Mon,  2 Oct 2023 17:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D49B60B21
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OXx/ut40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJg0BiMxpjeR; Mon,  2 Oct 2023 17:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 439056076C;
	Mon,  2 Oct 2023 17:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 439056076C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE32C0071;
	Mon,  2 Oct 2023 17:40:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75ABFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FA9340888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA9340888
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OXx/ut40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GiKuUl0GGOT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:40:13 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DE774087A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DE774087A
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so24717b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696268413; x=1696873213;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G85KjuFiBO73o7Wzp/yJK1STnMsGHZl8ZA4ohW5rdb0=;
 b=OXx/ut401s0YnyBtMTpRzmO8U7vq38mhJxwYgPo1N/QBTSeztYrWbO86STukj8SzYv
 sHCjmSBhZp9t8ttGF/HYqUkCLed2MKDHAsxlnYsCmqDX7f1CvrVtCCCpPDT4vYeRtbNc
 kh0ugMMfExjzBsV9CCmUKh/Mjzs4uCQcD9BOG6Ho5oA4cOcBjPVUXyO1nUq2Adk9jo4z
 rOznou72V1HMIvn+pGy9IyR4ci18+9U5c51WHpntBpGN48+G2BxNtT+ux6JVIoT/FeFy
 qn/ejj1Xd+zxkZvAqNqKKARYg+EopE9qqjSqec/ns7upUc3fLsCBk43m7qmJUeZJY2Nd
 kkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696268413; x=1696873213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G85KjuFiBO73o7Wzp/yJK1STnMsGHZl8ZA4ohW5rdb0=;
 b=sb4lvweDk5ieFdwAi4z+7Dkd7XqWgeFjXJWR7QmVAk/aOhP9ZDBl6At1THocoVcts8
 xqlV65IuT6dQpgUxZupeVeUixoB1qPin1p/F0i8k6LlB2JEi+jEZF7Uy8qFbozRAB8w5
 0o4CnfquoTGIN6AdT84Dky9lTkfXfxVsIY/fQOVurFBhY6NWV+/ORWQD7MUce1hFQdVd
 OUfcHWzu4f59zzTzzxwUGiKuMumhF5tGtjeNsB9r56gU2iqDlhLp8rCi1KuCOdA4O3t/
 O9sU+MVvpV+CFdehHLEqCJ6YUALjN81tWRfjoI6NN6mJbZfF+w9pJNQeZDi+BeKUQrNA
 9nxg==
X-Gm-Message-State: AOJu0YxRrQsGR6RUBII6OMtNLuXQ8QD3MJpAcAJNdpQNOd7hfHpOkxTZ
 IkPquVxWn+T5+8SkkCM6XlA=
X-Google-Smtp-Source: AGHT+IFfnemkqgLkLIaFXsRgXJMqG3C9Cw5R8Sr91ipeEIpNMozmNWbJAPPEYNXlIB6+I8ZpFUwICg==
X-Received: by 2002:a05:6a20:4292:b0:157:b453:dbb9 with SMTP id
 o18-20020a056a20429200b00157b453dbb9mr12165018pzj.6.1696268412767; 
 Mon, 02 Oct 2023 10:40:12 -0700 (PDT)
Received: from swarup-virtual-machine ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 p22-20020aa78616000000b006932657075bsm58122pfn.82.2023.10.02.10.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:40:12 -0700 (PDT)
Date: Mon, 2 Oct 2023 23:10:06 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	q@swarup-virtual-machine.lists.linuxfoundation.org
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <ZRsAdi/LOEFPY6j1@swarup-virtual-machine>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
 <2023100253-aide-authentic-5aa1@gregkh>
 <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>
 <2023100207-unmoved-arbitrary-2c33@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023100207-unmoved-arbitrary-2c33@gregkh>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
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

esOn Mon, Oct 02, 2023 at 05:46:49PM +0200, Greg KH wrote:
> On Mon, Oct 02, 2023 at 09:10:30PM +0530, swarup wrote:
> > On Mon, Oct 02, 2023 at 04:42:03PM +0200, Greg KH wrote:
> > > On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> > > > Fix kernel-doc warnings discovered in usb driver.
> > > > Fixes this warning:
> > > > warning: Function parameter or member 'gfladj_refclk_lpm_sel'
> > > >          not described in 'dwc3'
> > > > 
> > > > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > > > ---
> > > >  drivers/usb/dwc3/core.h | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > 
> > > What commit id does this fix?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Hi Greg,
> > Please find the commit id as mentioned below,
> > next time onwards i will mention it:
> > 
> > Fixes: 5cd07f96c0c6 ("usb: fix kernel-doc warning")
> 
> That is not a valid commit id in Linus's tree, are you sure it is
> correct?
> 
> And please resend the patch with that information in it.
> 
> thanks,
> 
> greg k-h

Hi Greg,
  I send patch V2, with the Fixes tag being mentioned.
  Please check the email.
Thanks,
Swarup
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
