Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFEBC83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 12:43:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0A8206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 12:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaPoyij6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0A8206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5556584906;
	Tue, 28 Apr 2020 12:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VS+Ls0p1ilQQ; Tue, 28 Apr 2020 12:43:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 709A88475D;
	Tue, 28 Apr 2020 12:43:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64C35C0864;
	Tue, 28 Apr 2020 12:43:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AA0CC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 12:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1955A855C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 12:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sh6HmqTITz10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 12:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9C3C1854E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 12:43:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l20so2336976pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gBw3cYXB1JrScHWOou+H7b6Q+VxWVe4/1UMFoF1kxow=;
 b=FaPoyij6X6iGa1zkiaXI/2nSQXol/oboQc6mhyhNPE27EoK9HRllPGKuNqZNx8/2R+
 zXbi4/jKWEi4hxpYVcqDgs3/W+zFaYToCTQXJb6ZyZe4MwCW5WTHQiXFYlCCoDaDw69h
 Kq9EZ+xgC5miVgH8ne2UlN1E0zXIpP6kJtsga5YNAOs61LPS6AT+yl1cI0o3sC37rweD
 rJPZ0K5FCjcG08pufWTICvl58ra8bo5XojZ+GazGZchkLxFs4bQEBGD4yMBg/ih2fCim
 6Cbs92dQahfr7pgoEMU/zNEBU0EonftSHjJZ3JfP0tgtHs6LrBbAN0clNawVQDPsuAAf
 Ko8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gBw3cYXB1JrScHWOou+H7b6Q+VxWVe4/1UMFoF1kxow=;
 b=XYqCM/Z/ca3OXmjLpKeMxIM0byJEAuAOGs1oz6iQanFrTLkMPI8/U0ypmvw6VMqw45
 pRFtyPN2W/wpw427vtUlS/V/37NpXqNod8dMUY7WQ2eFv0tsPMusSHe2Y78MzRaFCV66
 k7FS3LhasmNlfsyhkWuS2mcEy4HuxlP0nFUhnqfZjTAuVTX2JS9IaowNVBqrB7r9/eY4
 YsBpj/x6gyMbeT9ER8QXDQjV01bKjDa9EZ4IO+eq4FqPNws9hH2MZWKZIjzspuvcJlC9
 nUX2hDP17cdJ4EmRlGhZz8rX4mhDY5cy9xDffOC+vO21U1N/h/Jmwz8SiIjhQkr5qNvD
 Ew2Q==
X-Gm-Message-State: AGi0PuasjOwy4lUcxRCcZs6D8OIlGD5pMUt2uPOdRvpnPxNsjpIZPygY
 ycTU/izJWYexdejerbTIF2U=
X-Google-Smtp-Source: APiQypLhV/8SSvecEP/GhNHbUZCHYDyPBtVy80wyIS+4VE5m7GZtwj/36nkXFHvU4YkBECtnmpr/zA==
X-Received: by 2002:a63:2a92:: with SMTP id q140mr6815461pgq.20.1588077824087; 
 Tue, 28 Apr 2020 05:43:44 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id p62sm14824780pfb.93.2020.04.28.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 05:43:43 -0700 (PDT)
Message-ID: <60aa6040df72a8ada9107e9e36673e82bf673bcd.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 28 Apr 2020 18:13:39 +0530
In-Reply-To: <alpine.DEB.2.21.2004271931170.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-23-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2004271931170.12657@hadrien>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 22/23] tests: Add test case for
 removing parameter attributes
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

On Mon, 2020-04-27 at 19:31 +0200, Julia Lawall wrote:
> 
> On Mon, 27 Apr 2020, Jaskaran Singh wrote:
> 
> > Add a test case for removing Parameter attributes. The test case
> > checks
> > correct removal of the attribute when it is:
> > 
> > - before the parameter type.
> > - after the parameter type and before the parameter identifier.
> > - after the parameter identifier.
> > 
> > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > ---
> >  tests/remove_param_attrs.c     | 11 +++++++++++
> >  tests/remove_param_attrs.cocci | 13 +++++++++++++
> >  tests/remove_param_attrs.res   | 11 +++++++++++
> >  3 files changed, 35 insertions(+)
> >  create mode 100644 tests/remove_param_attrs.c
> >  create mode 100644 tests/remove_param_attrs.cocci
> >  create mode 100644 tests/remove_param_attrs.res
> > 
> > diff --git a/tests/remove_param_attrs.c
> > b/tests/remove_param_attrs.c
> > new file mode 100644
> > index 00000000..8ec1ffde
> > --- /dev/null
> > +++ b/tests/remove_param_attrs.c
> > @@ -0,0 +1,11 @@
> > +int func1(int x, __nocast int y) {
> > +	return 0;
> > +}
> > +
> > +int func2(int x, int __nocast y) {
> > +	return 0;
> > +}
> > +
> > +int func3(int x, int y __nocast) {
> > +	return 0;
> > +}
> > diff --git a/tests/remove_param_attrs.cocci
> > b/tests/remove_param_attrs.cocci
> > new file mode 100644
> > index 00000000..43f5a204
> > --- /dev/null
> > +++ b/tests/remove_param_attrs.cocci
> > @@ -0,0 +1,13 @@
> > +@@
> > +type T,U;
> > +attribute name __nocast;
> > +identifier x,y;
> > +@@
> > +
> > +T x(
> > +    ...,
> > +    U y
> > +-	__nocast
> 
> So the idea is that the attribute is removed no matter where it
> occurs?
> 

Yes, if the attribute occurs in the parameter.

Cheers,
Jaskaran.

> julia
> 
> > +    ,
> > +    ...
> > +  ) {...}
> > diff --git a/tests/remove_param_attrs.res
> > b/tests/remove_param_attrs.res
> > new file mode 100644
> > index 00000000..3705e814
> > --- /dev/null
> > +++ b/tests/remove_param_attrs.res
> > @@ -0,0 +1,11 @@
> > +int func1(int x, int y) {
> > +	return 0;
> > +}
> > +
> > +int func2(int x, int y) {
> > +	return 0;
> > +}
> > +
> > +int func3(int x, int y) {
> > +	return 0;
> > +}
> > --
> > 2.21.1
> > 
> > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
