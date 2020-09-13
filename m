Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE03C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:10:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1821207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FggDq+Dj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1821207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 777DC85E7D;
	Sun, 13 Sep 2020 18:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rxLQxrKgdMs; Sun, 13 Sep 2020 18:10:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D03EF85E27;
	Sun, 13 Sep 2020 18:10:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2E45C0864;
	Sun, 13 Sep 2020 18:10:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E9E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D44FE2038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeO2hv2XG5Fj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:10:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id E5AEF20384
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:10:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g4so15442607edk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mtmirikrT7fCsPx0l1erQNtD+zPZUPVQeKSvitc7ECk=;
 b=FggDq+Djfiqbn/watVCjIyB5PqzDFxfr+5qhG7nB1fxGzqLIU1CepeqUDy6RMM7GsQ
 sjp//Rd87Kjm1wUrElVidqpTl5txg8dzdwEmKOIqP0I+YvFO/zbD5RqsLfzlD2vPU2De
 nfiAgrNBqKjbk3dFbnl5JGCZMIKm9Z8DV/njPbjD1dllf4u/QXZKjQQLcaadKJTGIYI6
 q+naznXE7WOk+1f8jR5E3KaPrih8G9oPXTwKzzS0HK1yhS+6+jE4JZQgGzyZgqotNchL
 b7iwOdk6zMbvFUDTLZgAzlqWJcgOi7D2PM06ZX5Mk8oGIi3v66zOK5i97DwDzxeo6Zkg
 kGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mtmirikrT7fCsPx0l1erQNtD+zPZUPVQeKSvitc7ECk=;
 b=BeW4LP1zI/hC4pVGvkqQJ9ln6LST0wBbwklzkALg7olHRkZqO9TOOEr8N0QSy1vnnW
 jVLjoCSng21YrFLNRcUYwPvQ4yjOR+oJNLG9m6b8uI6BtAk8JerL+4OPo/OjEe0WvaXi
 EfYMwAaKW6I3SYn+yDLZLxF9a9oSMimUaJGq4ekp8KfpG3WBA6JINauH/ZhWq9mYcGbv
 vvTgGfzGUze+6ti5uxlpPY+vKVr9eTASpd9CJgoRZmbsFD2hYkJOGNvzGEuHrpORBJt4
 Y75i69oM9j+ij0X62G38saH1UKbTts7H7KdPQqxof5qzNBJEPQCveiDeg4jY7QoAgB59
 ur8g==
X-Gm-Message-State: AOAM530e1ItAeolFNPYDMHhxMHj2m7k8LdoMZmWgX59Ghv8vDDLJnHNi
 9tbEFbJNjB7zrkL1ZZbk/3g=
X-Google-Smtp-Source: ABdhPJyeZYoIwU0uSzVPwfyTMTye7ok8zLoh3Kbf1EBu3ZRoHaTj+XbLQneOJkNmeSqrgcBcZIizzQ==
X-Received: by 2002:a50:c051:: with SMTP id u17mr14288972edd.39.1600020600063; 
 Sun, 13 Sep 2020 11:10:00 -0700 (PDT)
Received: from felia ([2001:16b8:2d3b:f900:88a1:c74d:ade5:5c5a])
 by smtp.gmail.com with ESMTPSA id q26sm5800074ejr.97.2020.09.13.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 11:09:59 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 20:09:53 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
Message-ID: <alpine.DEB.2.21.2009132005270.6806@felia>
References: <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
 <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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



On Sun, 13 Sep 2020, Ayush wrote:

> > Did checkpatch.pl output on other types change?
> > 
> > One of the testers on this list reported that two COMMIT_LOG_LONG_LINE
> > reports disappeared. That should not have happened, right?
> > 
> > I had a look at the checkpatch.pl output for commit 0a2bd55c194a ("dm
> > integrity: document allow_discard option").
> > 
> > I think the reported line is wrong here.
> 
> After the patch, It reports the following line:
> 
> #6: 
> Add decription of the allow_discard option added in commit
> 
> Which I think is right as the author wanted to refer commit, which started from the word "commit"
> in the reported line only.
> 
> Please give your opinion on this. 
>

Well, I think the line number should point to the line where the error is 
and which needs to be fixed.

Can you point me to the error in line 6 that checkpatch.pl complains 
about?

Or is the error in line 7? :)

By that logic above, it should then point out line 7.

I have seen compiler and tool output always point to the line where the 
syntax error is, not to the line where the command might have started etc.
 
> 
> > Also, the line number for other cases have changed.
> 
> 
> Actually I am noticing a weird thing. When I run checkpacth.pl on multiple commits using v5.7..v5.8,
> It is not showing correct output, like for some commits, I can see the command when run on multiple commits
> did not report an error but when I ran on that individual commit, it's reporting an error.
> 
> 
> - Running scripts/checkpatch.pl --show-types -g v5.7..v5.8, gives (for this particular commit):
> 
> -----------------------------------------------------------------------------------------------
> Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler")
> -----------------------------------------------------------------------------------------------
> total: 0 errors, 0 warnings, 15 lines checked
> 
> Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler") has no obvious style problems and is ready for submission.
> 
> 
> 
> - Running scripts/checkpatch.pl --show-types -g 3dbf1ee6abbb, gives:
> 
> 
> ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler")'
> #11: 
> cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in
> 
> total: 1 errors, 0 warnings, 15 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler") has style problems, please review.
> 
> 
> 
> This is the reason the analysis on a large no. of commits was incorrect.
> 
> I need to investigate this more and check if it's an issue on my side or on the checkpatch.pl side.
> 

Yes, we should investigate that. If checkpatch.pl does not work properly 
with git ranges, we should fix that first. Otherwise, all our evaluations 
are broken...

> Also, I noticed one more issue with my patch, it doesn't handle cases like:
> 
> - commit
> 1234567890ab ("foo
> bar")
> 
> 
> Due to this, some new GIT_COMMIT_ID errors were also reported.
> 
> So, I will try to address this in the next version.
> 

Looking forward to your next version.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
