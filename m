Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E83C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jul 2022 19:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D57B41630;
	Fri,  8 Jul 2022 19:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D57B41630
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ufb7JbLa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xobYljoK_40U; Fri,  8 Jul 2022 19:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10A83400FD;
	Fri,  8 Jul 2022 19:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A83400FD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E017CC0033;
	Fri,  8 Jul 2022 19:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA24AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 19:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AED2C42473
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 19:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AED2C42473
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ufb7JbLa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQHaZSD4fiLH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 19:10:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310BE423E4
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 310BE423E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 19:10:19 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id k15so20568875iok.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jul 2022 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qkcbC6yq5XLhBzTTu+MMovI7rdFjrz0afp4P2lwP3Gk=;
 b=Ufb7JbLaRhwgNFKC3wKUcoi0CLM79ax4hGpkwdpDERueBoG2oimALdcBQiMMdk8AQ0
 S4bIhQsF1yRoxsk9YWyrT2KajKQlFdZXYuGkuaExm2x8kCra+o5KI23F/7QJl0sFwi/5
 ZmHqrmRYDUBYnC3YIiaBwMMTlPSxuGkX9O+7cTrfcKBB3cf4u7k8R3mSWesnJOXh72Qc
 /P1QeI/wFCk8Ct6GoGKa7uuf8G6ztBGEYJLSJx3z4mwtRR0vIy8Qr6oQVs3pG0LWQf+V
 fzqa/tH4Anl7pjYUUO4okchtUi+3/smTZNVRXNCE9fSr8M2Gb6sQj/fS7+zyv7QgBVZl
 rprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkcbC6yq5XLhBzTTu+MMovI7rdFjrz0afp4P2lwP3Gk=;
 b=5xXg/svIMAPqauIqPu7FanNqqIbb4W2ijUbR0Tqb6G/h3Gi110NQfw71w0EG0rnOhL
 dIIrYwHGh5mdjsnngQk1KQgVSgTH9cZa2qYcitM9m5a80i8UgnnOUVn/WU9KPeyEzNDE
 RwXWV1q+yM4QCHJmEBEip781cPH9vO+2b1suGDGfP62PqUe/OMmQYu1KFtQcs18HfR52
 Z0hr0Lh4gfO8wPzm/jWrkitspNJQgOtCib9zRJIhufPZ2ihgfVHRQ1eg2ovBdEAUqW2G
 h7C3y9LnGAdD06A6yGWoRmbLCKwC2FBSYdMhGKSVtCxdC2OVzt+CHYODYhRGH7NscCAG
 8yYQ==
X-Gm-Message-State: AJIora9oT7xSSgG11W5ZCUMSvd3R4hHYX/FS/chY2G1nKK9AfR55q1PD
 bkoB0O7Hn+1Bd641wAHE64c0pd2IMpgPEISxPTo=
X-Google-Smtp-Source: AGRyM1vjrSQNi3fUurB4mnaqOn2/DN69XlyXYO+6EfgfC+s7JyKUTAOAPdIQ9gUdIjFF2zBdLd86vSxWQZKRB/0SjcQ=
X-Received: by 2002:a05:6602:1682:b0:65d:f539:e30 with SMTP id
 s2-20020a056602168200b0065df5390e30mr2690129iow.81.1657307418278; Fri, 08 Jul
 2022 12:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220703192448.13763-1-khalid.masum.92@gmail.com>
 <Ysgn0hxHkt3pvzAB@kroah.com>
In-Reply-To: <Ysgn0hxHkt3pvzAB@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sat, 9 Jul 2022 01:10:07 +0600
Message-ID: <CAABMjtF98YwVaaaAKftFyta5CPM2As=1ykvyDf8CDLsCusKxkQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Describe function parameter 'mult'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 8, 2022 at 6:49 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 04, 2022 at 01:24:48AM +0600, Khalid Masum wrote:
> > Currently the parameter is not described. Which triggers warning when using
> > make htmldocs. Fix it by describing the parameter.
> >
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
> >  drivers/usb/dwc3/gadget.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 8716bece1072..e8c86b08cd83 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -657,6 +657,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
> >  /**
> >   * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
> >   * @dwc: pointer to the DWC3 context
> > + * @mult: multiplier, 'mult' value for SS Isoc EPs
> >   *
> >   * Calculates the size value based on the equation below:
> >   *
> > --
> > 2.36.1
> >
>
> Does not apply to my usb-next branch :(

Thanks. I looked into usb-next and a fix is already there.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
