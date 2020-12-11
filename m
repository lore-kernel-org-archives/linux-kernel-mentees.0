Return-Path: <SRS0=qh4O=FP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6380FC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:27:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C500823ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C500823ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5644287251;
	Fri, 11 Dec 2020 06:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xi32waEPCVYS; Fri, 11 Dec 2020 06:27:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D14BB87213;
	Fri, 11 Dec 2020 06:27:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1AE9C0FA7;
	Fri, 11 Dec 2020 06:27:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5798C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8F6D2741E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uZlBMbybisA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by silver.osuosl.org (Postfix) with ESMTPS id A82F427400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:27:40 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id i9so8352447ioo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 22:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5NUzWCEFOtCxJwpn6zsbT2E5FDOkhkGDdMwTgN8GIYc=;
 b=Vp4eKo4r4F9y8/GV+2aZUdbWfY0C+CbB4+TRGETHQLHYc0Ik0Z95m9mpLowO4JriC8
 ozN7xk8HNCUCMj5SIWgBbd42ezDRr37sjziRYSpq+8OcqVL3rrKDn1ZVa/j38uzP2GmR
 /KKmTsZbuM7H3/LDF/klQQlfocu52766jYdMHcAHByE2OLayr+tVKpSOLEGdMhAYycZk
 R5YNDA/fsaOKvYJv0BsMDSdl9SrlIQrgdFeGiwq3B6CSFOsRBxYbKhlnGsiYUBcnzfyn
 dm+pg7rgyBOqkiawKod0Ob/0iSMtcu7T7+xjd/Wijzf6X7c12m2Y4GzKIm5xYFGzJKh1
 ISWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NUzWCEFOtCxJwpn6zsbT2E5FDOkhkGDdMwTgN8GIYc=;
 b=U6u9c5l5KGIGcRD5yUTMa6PpfLGvPcyIoKU2OPkjWfCZZCUTkFLx/72xtRq2n9GMTk
 2+4SeLANnU+SmQt2zrKSkd9tdmqCNaDv01SMCuH0sRBNrfjVSoJuZtdSdUm7CyzxzDc/
 K+Pj3sGJp/9onCLudS0hsLMxq7JU36IV3ONlEg8bmxpjP0FDVf6jCkuXba08uWXV0P9M
 oDhuia71l3uyno84op51E27RGP0fKxQlYB72HVg5mQZkKKBXR+F91DEC8ydIvkAKXOc0
 1pQgfQd9w+for9rtiaNxzkLzXZhUFIBEM9YyMsTUiyNpd5EoSN1DsGHIZG+koBeoBQI4
 eFCQ==
X-Gm-Message-State: AOAM533/gCDVYu5FrrCYWlRGmXu3R7ImBh4S7n5Nba3bfeRXFGYLzqy6
 vJghWguL3utFLN1GJ+3hXl0YeLYqlXAOzOdGI5E=
X-Google-Smtp-Source: ABdhPJxdZgJQAyB9spXRm3yDUmfEBeKUlHBntEuDJ73CN/sKj2pdgz5ADTzChAD5BtoPZXoeF2nE+K9RF++Axh16P5o=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr13184492iom.102.1607668060006; 
 Thu, 10 Dec 2020 22:27:40 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
In-Reply-To: <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 11 Dec 2020 07:27:29 +0100
Message-ID: <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

On Fri, Dec 11, 2020 at 7:24 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> >
> > Aditya, Dwaipayan, can you set up a git repository that you use
> > together to work on this script?
> >
> > And provide a short description of how to use the script with an
> > example in that repository?
> >
> > Then, I am happy to try it out... and provide you more feedback.
> >
> > Lukas
>
> Hi Lukas,
> Sure enough, if Aditya doesn't mind, I will put up a repo for the same.
>

Dwaipayan, just set up a repository with your latest state that you
are currently happy with, then Aditya can fork that and put changes on
top as he might see fit and open a pull request, so you integrate them
back.

> Thank you,
> Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
