Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039D3C00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:33:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B65D20719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuJlifq0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B65D20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B0DFE204A5;
	Mon,  2 Nov 2020 07:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESSbObDAoJrs; Mon,  2 Nov 2020 07:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA0BE20482;
	Mon,  2 Nov 2020 07:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFD18C0889;
	Mon,  2 Nov 2020 07:33:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9735DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 85CFB86FDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsjvdPKccIil
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:33:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9EE4D87026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:33:11 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id za3so17501623ejb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 23:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=r5TApIUd8C1NpGmmU007XD0cz+t4RMQeaDN+cHE6Y4A=;
 b=GuJlifq0YQV3nSvyQuuKRmjsFhEL86BNaAtCkHam/tyKLn5Xn0hWnsCr37ctJh8fJQ
 +wmBT35JhlBkjLss4h4GCN9H40jSOjLXzyv8TGwLt1koMy58ystiA1aw1H4ilEl7tcr3
 AxJ0tohOoiIJB4j2TegS7+OqIq26d0UqL6oky3d6CzHW36qouezGIYAo3adoEudAmpZw
 av9RhvDC05YYvS487T8mcoKIYMXh0Wifqpu1Piskn9iqGGmQpVrsTZoqpNdwpCHobwjz
 fQqjSZqDhWgwh2aQVY5lSFPfziBWbEMBBAsvoMATK0ad7qRKmgyM0r+ZM9h5BmIMBANh
 Gkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=r5TApIUd8C1NpGmmU007XD0cz+t4RMQeaDN+cHE6Y4A=;
 b=TpFjxYKgKIj5m243zoAaCOcg3jFmu/nZGn07pzlGq0PgrqUCyXRrUrpDj25uCUmN0q
 PtZ7jTG9QnX18YllN8aadEHZ2oNP5EKoWibyksBG/NY2v1ze4ofwzMxnscrbVFwDEvH2
 U0YIdnfJYrry/JbuZk7VglALQsS/x8qhjPJ6kVEMIWDCjJHSI0N1t3G3240jljigmHwa
 JlbGeXDkBXGOO5NrkdwjQjRwjrqQ6ufUe1jxpphKWm+jy4wMn0c+9tK2fIKRikYVufFM
 xO6O8CMtP3njpDUM3wy0dI3dg5qze+YyuZAvjEQbih/qfnku8Qls+0u34VtDbobtOJ1X
 0/hA==
X-Gm-Message-State: AOAM531svZ4GoEMjOE2rglIUdS+kogD9df13AedkEz7FVTU0dnaNz6F3
 H6CzW8AK4HgYJfS/OZaPmk8=
X-Google-Smtp-Source: ABdhPJze3Ub4U/6R5m+CDVeLkcmpXEil4tiaAica4JZ1TCRGihkrLTVfwIqbFPZwp6fTMvm+BB8HEQ==
X-Received: by 2002:a17:907:2667:: with SMTP id
 ci7mr9184505ejc.282.1604302390091; 
 Sun, 01 Nov 2020 23:33:10 -0800 (PST)
Received: from felia ([2001:16b8:2d08:5700:a4fc:57d8:461e:80f1])
 by smtp.gmail.com with ESMTPSA id gb6sm8978775ejc.21.2020.11.01.23.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 23:33:09 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 2 Nov 2020 08:33:07 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <dbe7fc9c-8b68-aa2a-f35b-1a387b373186@gmail.com>
Message-ID: <alpine.DEB.2.21.2011020831130.11801@felia>
References: <20201031132556.10379-1-yashsri421@gmail.com>
 <dbe7fc9c-8b68-aa2a-f35b-1a387b373186@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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



On Sun, 1 Nov 2020, Aditya wrote:

> On 31/10/20 6:55 pm, Aditya Srivastava wrote:
> > Currently, if a line exceeds 75 characters in a commit message,
> > checkpatch.pl gives a warning corresponding to the same.
> > 
> > E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
> > for some cards having 0 maximum voltage") reports this warning:
> > 
> > WARNING: Possible unwrapped commit description (prefer a maximum 75
> > chars per line)
> > 
> > Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.
> > 
> > Fix this warning by truncating the line after 75 chars, and push the
> > remaining content to the next line
> > 
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 5329927fc1c1..a0107ed257d1 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2881,8 +2881,20 @@ sub process {
> >  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >  					# A Fixes: or Link: line
> >  		      $commit_log_possible_stack_dump)) {
> > -			WARN("COMMIT_LOG_LONG_LINE",
> > -			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> > +			if (WARN("COMMIT_LOG_LONG_LINE",
> > +			     	 "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr) &&
> > +			    $fix) {
> > +				fix_delete_line($fixlinenr, $rawline);
> > +				my $curr_line = $rawline;
> > +				my $fixedline;
> > +				while (length($curr_line) > 0) {
> > +					# trim current line for any unnecessary spaces
> > +					$curr_line = trim($curr_line);
> > +					$fixedline = substr($curr_line, 0, 75);
> > +					fix_insert_line($fixlinenr+1, $fixedline);
> > +					$curr_line =~ s/$fixedline//;
> > +				}
> > +			}
> >  			$commit_log_long_line = 1;
> >  		}
> >  
> > 
> 
> Hi Sir
> Seeking your feedback on this one
>

Please respect that I do have a full-time job and a weekend where I am 
supposed to work less than from Mon to Fri.

I will get back to you after two or three working days; if not, then you 
can ping me. Any ping early will just make me annoyed.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
