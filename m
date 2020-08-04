Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9F5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 19:37:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9530A207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 19:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="viLmcnlI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9530A207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2F43E20797;
	Tue,  4 Aug 2020 19:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tn2ggKMpNiT4; Tue,  4 Aug 2020 19:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F38D62002C;
	Tue,  4 Aug 2020 19:37:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3388C0050;
	Tue,  4 Aug 2020 19:37:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA737C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D67F887DD4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3gsg4LZzO-p
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 19:37:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5AA887DCE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 19:37:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id df16so14403010edb.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=2vZ6BIquQ81VMbJGsUwxdal4AOf/w+YJslqNNCHggtk=;
 b=viLmcnlI3kinOBuxSyT6yh9hNC2pADCrH7cDaDSKGZ+buc/IoMA8Puh+8MpnMgZ40/
 OTX6DeBLw8uNAl8cdIDEoaSjbynVjbT2Y0R6sTCxdQz5TyWBxMSHz9cwT6s8zOYyDepo
 Yro1+EPmEln9p4xmgCyS20h/q991hop9ZhsxSBfcgPtRoh0QxcDdC1+Uf3sQohdYb2GR
 a71enOSYD4xKXhqb9Iyo7t9PekdGVTpKh9uYLxvmuIPBqx61LUSwFNNXizplZthaGqDL
 N+B98qmf724WT/FwJ2WNLB6MI8GHS6YCBcTVxv5PSu4nVLdBqmXCCMcOOwi4/1fzO/qQ
 AJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=2vZ6BIquQ81VMbJGsUwxdal4AOf/w+YJslqNNCHggtk=;
 b=hTwpaHqjHEPWS9cG7+V9YdVo07nCYyD0pT1LjRWjqsFqQJjAH9cYV29IWf+tElrSPL
 gVGF3ICh6CHVUo95T+Bk96WazMNoxqafh7ZvVEMoVsaLe6AgDJiHyHdF6SLsr/6FFiD7
 AemPfZCuw7qeu8WpU1xdKMe2WTRkb1n0zl0j+x6fDpRmTUlbfxio8vBE+fjIXVnFPxHV
 xqT8KslAAd2A0g7AseR1C1FLHFNLvNs3GGfviYNqI8aNc9n9M5LwL3w3DzG2cOEmOSB+
 T160X5QLZgEH50n/892pXAgcV74VP6+ZkX5BtNs49LkZbDoEIK+bf7WrtgBOw0mMGnEV
 M81g==
X-Gm-Message-State: AOAM533sSS3fByuVzjP074SUqzW09qIbZuoZq06VY/OeCO8raiqZt4jE
 VD+FetgcBNzQHjztm9aUIAo=
X-Google-Smtp-Source: ABdhPJxlqCd6SdA1ACCSGGHz2C0JlPM7644E3ivYS9Gypc/vukmZO+m4wvNGOcbv6gYVA5r51YkiSg==
X-Received: by 2002:a05:6402:1d93:: with SMTP id
 dk19mr21579945edb.382.1596569855872; 
 Tue, 04 Aug 2020 12:37:35 -0700 (PDT)
Received: from felia ([2001:16b8:2d66:d800:3cb0:aa71:1ca4:1173])
 by smtp.gmail.com with ESMTPSA id h8sm19188561ejj.104.2020.08.04.12.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 12:37:35 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 4 Aug 2020 21:37:22 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008042131530.4346@felia>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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



On Tue, 4 Aug 2020, Mrinal Pandey wrote:

> On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > 
> > > The diff content includes the SPDX licensing information but excludes the
> > > shebang when a change is made to a script file in commit 37f8173dd849
> > > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> > > test"). In these cases checkpatch issues a false positive warning:
> > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > 
> > > Currently, if checkpatch finds a shebang in line 1, it expects the
> > > license identifier in line 2. However, this doesn't work when a shebang
> > > isn't found on the line 1.
> > 
> > It does not work when the diff does not contain line 1, but only line 2,
> > because then the shebang check for line 1 cannot work.
> > 
> > > 
> > > I noticed this false positive, while running checkpatch on the set of
> > > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > > This false positive exists in checkpatch since commit a8da38a9cf0e
> > > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > > when the corresponding rule was first added.
> > > 
> > > The alternatives considered to improve this check were looking the file
> > > to be a script by either examining the file extension or file permissions.
> > >
> > 
> > Make this sentence shorter. Try.
> >  
> > > The evaluation on former option resulted in 120 files which had a shebang
> > > in the first line but no file extension. This didn't look like a promising
> > > result and hence I dropped the idea of using this approach.
> > > 
> > > The evaluation on the latter approach shows that there are 53 files in the
> > > kernel which have an executable bit set but don't have a shebang in the
> > > first line.
> > > 
> > > At the first sight on these 53 files, it seems that they either have a
> > > wrong file permission set or could be reasonably extended with a shebang
> > > and SPDX license information. Thus, further cleanup in the repository
> > > would make the latter approach to work even more precisely.
> > > 
> > > Hence, I chose to check the file permissions to determine if the file is a
> > > script and notify checkpatch to expect SPDX on second line for such files.
> > >
> > 
> > There is no notification here. Think about better wording.
> >  
> > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > ---
> > >  scripts/checkpatch.pl | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 4c820607540b..bae1dd824518 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -3166,6 +3166,9 @@ sub process {
> > >  		}
> > >  
> > >  # check for using SPDX license tag at beginning of files
> > > +		if ($line =~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > +			$checklicenseline = 2;
> > > +		}
> > 
> > That check looks good now.
> > 
> > >  		if ($realline == $checklicenseline) {
> > >  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > >  				$checklicenseline = 2;
> > 
> > This is probably broken now. It should check for shebang in line 1 and 
> > then set checklicenseline to line 2, right?
> 
> Sir,
> 
> Should we remove this check? Earlier when I checked for file extension
> we had 120 cases where this check was also needed but now we have a
> better heuristic which is going to work for all cases where license
> should be on line 2 irrespective of the fact that we know the first line
> or not.
>

Are you sure about that? Where is the evaluation that proves your point?

E.g., are all files that contain a shebang really with an executable flag?

Which commands did you run to check this?
 
> If I am missing out on something and we should not be removing this check,
> then I suggest placing the new heuristics below this block so that it doesn't
> interfere with the existing logic.
> 
> Please let me know which path should I go about and then I shall resend
> the patch with the modified commit message.
> 

Think about the strengths and weaknesses of the potential solutions, then 
show with some commands (as I did for example, for finding the first 
lines previously) that you can show that it practically makes a 
difference and you can numbers on those differences.

When you did that, send a new patch.

Lukas

> Thank you. > > 
> > > -- 
> > > 2.25.1
> > > 
> > > 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
