Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CEBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 07:44:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D93D2087C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 07:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyCJD3Od"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D93D2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4046086BCF;
	Sun, 18 Oct 2020 07:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6pfCuVDQyt2; Sun, 18 Oct 2020 07:44:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98D2F86AD1;
	Sun, 18 Oct 2020 07:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8200EC0052;
	Sun, 18 Oct 2020 07:44:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F696C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E94F226FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOFlbXlBzQpW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:44:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E291226F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:44:06 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id e22so9559796ejr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=qeoM8UNyEfVW0mOpHg13INjoPDjG2RiYln5hMBbg5YM=;
 b=qyCJD3Odb8JdLd8YmbZ9Wu9mRtnetUqyDOsbwxvAEn3HIkOf0NY7IU+3hWBTirQlKq
 VWfKHJ0Hv5IhmYnrOpbUggtgzgVnadTTQ1BmOZZnFzmCp90Tz44fw9v0OIisfsRU9pcD
 nr9oPs5kvB96d8S+B02yv9etPakBIvTCKHq7qcuyEXi4jFT4Q/aClxM9b/1ItaJojBKY
 0uUcQVwvGPHQ2N624Y7Nui+871Qm0pOZfhFTlIj0IHYDZlfEnD73NOdErgdI17baFi3w
 OIT6s08GhrlwKHnAkBQq5Sn/47vpWNiFTke1fxNniijZ4X/WM/uE48Gcqmx0DCjaxFRx
 f1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=qeoM8UNyEfVW0mOpHg13INjoPDjG2RiYln5hMBbg5YM=;
 b=emQ9uzseaOQtJhSV3kUpV/MeLLrZ/bWmJT0meIkEdL0na1uC6eWsuxgQcKpF2GQpQq
 Ntn/6/puPMTJGDWOUXjnCBbc/zQgYaJomfFx35uOM2fMo5+wx0TIXpLTSoxESxAM7yuF
 6XcM+4lPHOj5m1TFQIXOBoUj0e3iPHQ2jbkVNOMS/Sw7q18tDLQfVfmz36JW0ktgTQVz
 0+GAu0bBrzfxgCYZCtlf9XYHbKf47G6x0tuzGqRqME/M5YN7GA0uzOkx0Xa0ZUXXenvW
 J2GrnZly/cEBCI8MtgGGZMS7fKzJ4pNxyPw4lXk5EyRP3XDIL52F7ZeHfQXwDDz6ULVn
 Csdw==
X-Gm-Message-State: AOAM533axzj4ZSZRyYwa9l6/niV2yTugEYz5jl+7Yr7OwQTw49Z5Gfd8
 tOmNCsvakR9af4fwraB9Rv4=
X-Google-Smtp-Source: ABdhPJzntfBsJwfFS5qJTi/osGuBLv3a59WSMUmqfH/Im9IIwLCNuvUsYfRg8tACbZYwpYrzFN5WGQ==
X-Received: by 2002:a17:906:940c:: with SMTP id
 q12mr12101724ejx.195.1603007044467; 
 Sun, 18 Oct 2020 00:44:04 -0700 (PDT)
Received: from felia ([2001:16b8:2d38:bd00:6107:df88:6f44:4e10])
 by smtp.gmail.com with ESMTPSA id k23sm7057286ejk.0.2020.10.18.00.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 00:44:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 18 Oct 2020 09:43:56 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <72615293-a433-9d19-ae9e-ec9dd2c2073c@gmail.com>
Message-ID: <alpine.DEB.2.21.2010180933020.6939@felia>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
 <ebc09f62-7ba3-0965-e999-0ca33156f40f@gmail.com>
 <72615293-a433-9d19-ae9e-ec9dd2c2073c@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
 whitespace in formatted email
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



On Sat, 17 Oct 2020, Aditya wrote:

> 
> On Wed, Oct 14, 2020 at 10:33 PM Aditya <yashsri421@gmail.com> wrote:
> 
> >
> > On 13/10/20 11:46 am, Lukas Bulwahn wrote:
> > >
> > > On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
> > >
> > >> Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> > >> checks.") introduced new checks for author sign off. The format_email
> > >> procedure was modified to add comment blocks to the formatted email. But
> > >> no space was added between the email address and mail comment.
> > >>
> > >> This causes wrong email formatting in cases where the email is in the 
> > form
> > >> "author@example.com (Comment block)". The space between the address and
> > >> comment block is removed, which causes incorrect parsing of the
> > >> formatted email.
> > >>
> > >> An evaluation on checkpatch brought up this case. For example,
> > >> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key 
> > calculation"),
> > >> the following warning was reported:
> > >>
> > >> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big 
> > endian
> > >> system concerns)' might be better as 'David.Laight@aculab.com(big 
> > endian
> > >> system concerns)'
> > >>
> > >> Add a single space in between the address and comment when the
> > >> extracted comment is not empty.
> > >>
> > > Dwaipayan, looks good to me.
> > >
> > > So, how about a 'Fixes:' tag?
> > >
> > > Aditya, can you rerun your evaluation with this fix patch applied on top?
> > >
> > > Then, we need a comparison for:
> > > 1. completely before vs. after the two patches, and
> > > 2. after the first patch vs. after the two patches (to see that the fix 
> > > works)
> > >
> > > More support on evaluation from others interested to become mentees are 
> > of 
> > > course welcome.
> > >
> > > Lukas
> > >  
> > >> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > >> ---
> > >>  scripts/checkpatch.pl | 4 +++-
> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > >> index fab38b493cef..f1a4e61917eb 100755
> > >> --- a/scripts/checkpatch.pl
> > >> +++ b/scripts/checkpatch.pl
> > >> @@ -1221,7 +1221,9 @@ sub format_email {
> > >>      } else {
> > >>              $formatted_email = "$name$name_comment <$address>";
> > >>      }
> > >> -    $formatted_email .= "$comment";
> > >> +    if ("$comment" ne "") {
> > >> +            $formatted_email .= " $comment";
> > >> +    }
> > >>      return $formatted_email;
> > >>  }
> > >>  
> > >> -- 
> > >> 2.27.0
> > >>
> > >>
> > Hi Sir
> >
> > I have analyzed the reports using this patch and made comparison. The 
> > links are as follows:
> >
> > 1. completely before vs. after this patch: 
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/before_v_second/summary_relative.txt
> > 2. after the first patch vs. after the two patches: 
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/first_v_second/summary_relative.txt
> >
> > Kindly let me know if you have any questions.
> >
> > Aditya
> >
> >
> 
> Hi Sir
> I have completed all the assigned tasks. What should be my next steps to participate as a mentee in the community bridge program?
> Kindly guide me regarding it.
>

(your email client is broken; it should not spread lines so long...)

Aditya, you are on a good way to be towards acceptance for a kernel 
mentorship.

If I am not mistaken, you have not created yet a non-trivial patch to 
checkpatch.pl and got your patch accepted.


Look at your own checkpatch.pl evaluation, find a relevant case where 
checkpatch.pl reports a large class of false positives and think about how 
to improve checkpatch.pl.

Especially, when looking at checkpatch.pl complaining about suspicious 
code patterns or style and formatting, you might want to compare to the 
capabilities of compiler static analysers (clang-tidy) or clang-format.

Improving those tools, making them the warning-free for the specific 
class and supporting to make them default tools might also be a good 
extension to the goals of checkpatch.

Let us know which kind of false positive class you found and would like to 
improve.

Dwaipayan and I can help if you really do not find anything at all...

Good luck :)


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
