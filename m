Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D01EC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:13:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC32206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u+PXFPz5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC32206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9ED12035B;
	Thu, 17 Sep 2020 14:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnOUdJhXu4v7; Thu, 17 Sep 2020 14:13:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 059651FEAE;
	Thu, 17 Sep 2020 14:13:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E884EC0864;
	Thu, 17 Sep 2020 14:13:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB721C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 912D420109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTffD5oBQ5U1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:13:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 8BA181FEAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:13:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j2so2253470wrx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0h95GrV5cBVcNqyLtXVVKWSiQXAHMdda58TfgJoyCAI=;
 b=u+PXFPz5/GJmDNk9CBw2J3A/njFRNIMPPhkyYGR/YVTc5FK9pQwiuiK907JdHyCgo1
 K/PdA7Dapke5+AQmqLbCW1kNA5TJekBnBuqdHLBOIEmRMIb2sX7a7j7C6e5L90RJ1msj
 7jegz0zC7OvT7E0ltnbntQlBRBxEA6++Jz6EjGoz3lA33Cag8IDfnEZkb6atsfypDIm3
 Gel/L+imvXhkxwPXW9N6fJnI+zFslbsB/KziZw1a4ANMcpN1NUXFYqpm5jMmdt9FZawq
 lUwZn8BMwfWdAu4Hs9adz/BCUfyD9le+EZOuzNRv8riyGueXOIZWZN9lT2oI72W425RX
 yBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0h95GrV5cBVcNqyLtXVVKWSiQXAHMdda58TfgJoyCAI=;
 b=hrIjFZvVGaWirouGroB86obsTBH8KnL5xmvO/ZXvJVHkQVFjMfqFaCnMk4x6IwOvo9
 ZcTP3z+ywtSBl9v2qh1dlwLnEodjRIbirJD/sIIPeRLzYShI3elLBHHA62OG51qZtwRy
 fFDOU9Ws1pUE/aNn6ZiNiM3Bv0EKjkjevKKS3kI6ZcmzHost/M9zPAfoUAZduTLsJ5fZ
 pQptdtHOsvK8RPtZ617F5Q5G3STcZn/GlJNSLqvEM0llXgJC/JQHwB7h3Y/U3r8VNWHO
 LuJ9GtthP5t3yxCD26IewkDOBBlUl7GXtBsqI1wOfVUpY3FmxG5Yw9i+TwTTeZkFGpoF
 O9DA==
X-Gm-Message-State: AOAM5308MDQABWaBH1Dbgm4bRb6H85NTspSrjuiUP4QYdqnFFQcACMlf
 TrDzqsCVyuGX8KHC4u3HXcY=
X-Google-Smtp-Source: ABdhPJwc9agmMzSUHqeDiWyNebZ3fwgYfcr3aLYTaxr5GmnxSPuEPy9K/NvvP86+6LmkpYiw+LVIWQ==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr32355034wru.7.1600352004767;
 Thu, 17 Sep 2020 07:13:24 -0700 (PDT)
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
 by smtp.gmail.com with ESMTPSA id c14sm37793928wrv.12.2020.09.17.07.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:13:24 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 16:13:18 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009171551090.9985@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
 <alpine.DEB.2.21.2009160837380.10877@felia>
 <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1598312163-1600352004=:9985"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1598312163-1600352004=:9985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 17 Sep 2020, Dwaipayan Ray wrote:

> 
> 
> > If you do your homework, proper research what was decided in the past,
> > proper evaluations what the difference of your change is, proper
> > implementation, proper arguments for your change, it has high chances of
> > being accepted. Many agree that checkpatch.pl can be useful, but many
> > agree that it needs some improvements.
> >
> > It is certainly not a quick improvement, and needs some thought to make it
> > really better.
> >
> > >
> > > > You can try to work that through or look for another case of potential
> > > > checkpatch.pl improvement in your evaluation data.
> > 
> 
> Hi,
> I would like to report you another finding about AUTHOR_SIGN_OFF.
> 
> I found that some commits with the same author mail and sign off mail 
> also threw off this warning when there were non-ascii characters in
> the name.
> Let me give some examples:
> 
> Commit 9d9cc58aff46 :
> 
> Author: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> .....
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> 
> As you can see, there should have been no error message, but checkpatch
> gave this:
> 
> WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
>  patch author ''
> 
> 
> Also commit 440d7a6f7390 and commit 424c85e1ffea by the same person 
> threw the error again. Evidently non ascii characters cause the parsing to fail.
> Both had the same chinese characters in the name.
> 
> 
> I also found another person with the same issue.
> Commit b03628b73564
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ...
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Checkpatch gave the warning:
> WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal 
> patch author '' . The string here is again empty.
> 
> Another same issue
> Commit f0a087a533b3
> Author: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
> ...
> Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
>

This is a very good investigation and I think it deserves to be handled 
better in checkpatch.pl if we can do this 'easily'. It is a bit involved, 
but I think it feasible because you do not need to write the complete 
encoding stuff.
 
> So you see in all these cases non ascii characters are present. I looked 
> into checkpatch.pl .
> 
> line 2662:
>         if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>            $author = $1; 
>             $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>             $author =~ s/"//g;
>             $author = reformat_email($author); 
>         }
>

Just a quick comment, referring to a line really does not work if you are 
not providing the sha of the git change you are looking at.

We might just be looking at two different versions, right? ...and hence 
the lines differ.

> When i looked into $line, it gave below:
> From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie
> =29?= <zhouyanjie@wanyeetech.com>
>
> And at the end of this block, $author was equal to ''.
> There seems to be a parsing problem there.
>

Agree. Somehow the parsing seems to be just not fit for the job...
 
> Does this seem like a proper fixable candidate?
>

Yes, please move ahead and see if you find a suitable way to handle names 
with these different encodings.

It is very good that you kept searching in your investigation data for 
problems that deserve a fix and are feasible to fix. If you can 
actually fix it in an acceptable way, That will get you a job for the
future; there is certainly some work ahead.


Lukas
--8323329-1598312163-1600352004=:9985
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1598312163-1600352004=:9985--
