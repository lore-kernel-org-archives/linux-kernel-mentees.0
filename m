Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF05C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 13:46:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F306115C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 13:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F306115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC7C40380;
	Fri,  6 Aug 2021 13:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1Iw5C-KccHD; Fri,  6 Aug 2021 13:46:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8EBBB400D5;
	Fri,  6 Aug 2021 13:46:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D9CAC0010;
	Fri,  6 Aug 2021 13:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02F96C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E707083A6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28Z_FlCPgK4M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13FE1831BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:46:35 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so13935334pjn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5lkmI4z7jiubMmtKXrbyc73dcU4KyvRkJwwhWwwiz94=;
 b=Up9FTrgLEIHfnEgnl2AoRejULSjvA5n2Ne1kUEVh5hKiz6km0lkzy0RQBrsxZl+tUA
 qewzqjqqqsSlqtLI45kvWeVU5gyoCmThTVPNhxJtr5nKbK859njVJHTbE4XABfoex2Xr
 Ki0HNstOGfFQSK4cqoqi1bRPBOFj4/2HqbFQqb/79GAaKnegP0SdctqU5gBL9dNTzGNj
 MhWWpqgH4IXE4DTnyp2CXzPawxJs2rsJcgVDblNy+TqVvyIknJMjq4ZneXappgsqBfWX
 ohrOQya5+6QipSmKoc8Hb9YjiqYAn7pBLH58pUIWy4J8G2RdUvrkWcs52P8RYu5uXjW8
 7R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5lkmI4z7jiubMmtKXrbyc73dcU4KyvRkJwwhWwwiz94=;
 b=cCePqx+GcsgUMSQFNuf5BUWl7ea2SIwquHGgd9KTe1wf4ywHc8kbNEfQoGvvzhGKlv
 qVWydNhHQGPsuJ+HPbb05wlFJVTBR8TxTkCmTKEwYY9EtYfSlWHDcPLHl/SU/uAIzKv6
 6btgG0Aoz4afFqgPgKcT8fBmsEQeGwT4DZUrepK/vPQmXeZA19wOvsSYW4+3WklPf3vK
 pzSo/yVGhmmEvdInsFp30XaImT07EJ9LgxbdDbRZdczxhVp+RcXZ8jrLU/S24QOZL5Gz
 RKI/Jne0AzQK4JiU4J5tOYFswB02ermjLPkKy9oYFb0laMKR6y2ndDQhfNbY5Tn5v4Bm
 6jtw==
X-Gm-Message-State: AOAM530bwkhtPZ+vhk4PK+gHlbbPIFGthfWWx/9JiBaQElkThzgJ7ORK
 69MAKfMTbn9RBnAWPbftzgg=
X-Google-Smtp-Source: ABdhPJx0Fl3eWPQrUhSTYhqlfMgdbaLtPERBLpoZDi8XqPb9OHvfyQW61c2xsa/WYPgXYCW+wckPdA==
X-Received: by 2002:a17:902:740b:b029:12c:403b:7fae with SMTP id
 g11-20020a170902740bb029012c403b7faemr8598833pll.19.1628257595389; 
 Fri, 06 Aug 2021 06:46:35 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:daf1:7357:b291:d057])
 by smtp.gmail.com with ESMTPSA id s7sm8943587pjk.40.2021.08.06.06.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 06:46:34 -0700 (PDT)
Date: Fri, 6 Aug 2021 19:16:24 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Message-ID: <20210806134617.GA6736@uver-laptop>
References: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
 <20210804153134.2794-1-utkarshverma294@gmail.com>
 <CABJPP5C42kH19aMt6dtK0auypE0HWen4YWMZDdC1xgVdFOGc-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJPP5C42kH19aMt6dtK0auypE0HWen4YWMZDdC1xgVdFOGc-w@mail.gmail.com>
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

On Thu, Aug 05, 2021 at 07:21:50PM +0530, Dwaipayan Ray wrote:
> On Wed, Aug 4, 2021 at 9:02 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> > subsection. Checkpatch documentation that recommends the user to use
> 
> Did you mean: Checkpatch recommends the user to use octal
> permission bits...?
> 

No.
This patch adds documentation that explains to the user why octal
permission should be used. So in the commit description, which explains
my patch I wrote, "Checkpatch documentation that recommends the user ...."

If it's sounding vague, then should I change the commit description to:

"Add a new message type SYMBOLIC_PERMS under the 'Permissions'
 subsection. Users should use octal permission bits instead of their
 symbolic macro names."

> Other than that the change itself looks fine to me.
> 
> > the octal permission bits instead of their symbolic macro names.
> >
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > ---
> >  Documentation/dev-tools/checkpatch.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > index f0956e9ea..009957cda 100644
> > --- a/Documentation/dev-tools/checkpatch.rst
> > +++ b/Documentation/dev-tools/checkpatch.rst
> > @@ -957,6 +957,12 @@ Permissions
> >      Permission bits should use 4 digit octal permissions (like 0700 or 0444).
> >      Avoid using any other base like decimal.
> >
> > +  **SYMBOLIC_PERMS**
> > +    Permission bits in the octal form are more readable and easier to
> > +    understand than their symbolic counterparts.
> > +
> > +    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> > +
> >
> >  Spacing and Brackets
> >  --------------------
> > --
> > 2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
