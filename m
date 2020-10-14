Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB3C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:22:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B712078A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1kM6djg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B712078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C07F087C89;
	Wed, 14 Oct 2020 07:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhPZ00fXvo9z; Wed, 14 Oct 2020 07:22:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7ACC487F74;
	Wed, 14 Oct 2020 07:22:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69685C07FF;
	Wed, 14 Oct 2020 07:22:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F857C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EFF3787C71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxUUHoLVNef7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 18A1587C57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:22:05 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id t25so3285651ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=uorydksgBqaQ4ZukUwiTFlIpgUZDNYHOUcspIwChfn4=;
 b=a1kM6djgb8r2mY4Zmju1VQeHpMs8lqF7dKA2Hq5Sm5HgTX09yH0/7N0mIfqPwu4FFf
 5UmV6Jkb2/cC7351j2qR651ReUqYisf1L7wT5ujYnfcTsQ/9O8FQECNE76Z6fZuGQZtx
 VMeq4OUFOLahMOMBnQeaNUeuX2tG5CjEbsPWNc4HmM69hhSkBdsr3jtItKA0TUJ2L/Tf
 DV5mSJElbzT0VjoyH0GHAUJsAZ9Q7vOveJRTQiZkshTfYJ01/2Cezf8jJfzG+jZQ5UER
 TapvKyE3YOZE8Zivx687E8kmruwXORqDAeu8+MiOlNwczGPLLwbYgBe86e3MPnpOlvyf
 yyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=uorydksgBqaQ4ZukUwiTFlIpgUZDNYHOUcspIwChfn4=;
 b=eeCtq2yNxID0Ztz1j/dwNk9GJCwaYVQrL2HzpJjcKh9BYPm3JjwPB8HL/bHAAgr7YT
 Ln0mbXNc5IKxsxY5eHAahlTma2HfVjzeMUQXDxVYMlXkZRwSMdmiy4WZENlYkj5FJ7OY
 ulPL35Tey1sOyU7saGIlDsZfXusXDTuGNL+mGBpZ62S+ZzpmWqEO97qG++iTg6UbJ8+H
 yGvtqPpBuhME1a+dXL/wNqsMy1s1/UZZJCBDKq8dxS3tUTlTSC5XMjsURPtbm0w1znIJ
 pNDVh5ZFVY/SiHwteHfBGkOQKeZBhcZ+C7UI6b8ourZwXDiQvhD0+wyECFe5Hhb+fE7D
 pQ0g==
X-Gm-Message-State: AOAM533MESSI5Hl6gd0JvOK1dOeEEe9KCPCsd3HtkoMateCktDEb3UnA
 e1yJMLGTGkQ7u0aIxnqUv40U2wAQ70UJJChS
X-Google-Smtp-Source: ABdhPJym4gsgurRxFcK0Pbc/RiPuK/+wcBci5uOHrbLJVOrlsVNmVRy7v92wUYChDNNPDzwKnjW6Tg==
X-Received: by 2002:a17:906:6409:: with SMTP id
 d9mr3854403ejm.344.1602660123206; 
 Wed, 14 Oct 2020 00:22:03 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id e17sm1143971ejh.64.2020.10.14.00.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 00:22:02 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 09:22:01 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <b8bea5b5-a8a0-b2b4-6c32-0fd071bb6ef7@gmail.com>
Message-ID: <alpine.DEB.2.21.2010140917560.6186@felia>
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
 <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
 <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
 <CAKXUXMy6AawtRNB6B3pPQK_QNT+NK1VT9QUBKQ4YGV-QbAkvBA@mail.gmail.com>
 <CAJ7RK2vQb=b6kGmZ3Xd7UKk9gieZbX+-CrTybqoksqjEh6m7Lg@mail.gmail.com>
 <b8bea5b5-a8a0-b2b4-6c32-0fd071bb6ef7@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Checkpatch.pl tasks for Community Bridge
 Program
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



On Wed, 14 Oct 2020, Aditya wrote:

> 
> On 13/10/20 2:41 am, Aditya Srivastava wrote:
> > On Mon 12 Oct, 2020, 11:58 PM Lukas Bulwahn, <lukas.bulwahn@gmail.com>
> > wrote:
> >
> >> On Mon, Oct 12, 2020 at 8:23 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
> >> wrote:
> >>> On 12/10/20 6:27 pm, Lukas Bulwahn wrote:
> >>>> On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <
> >> yashsri421@gmail.com> wrote:
> >>>>> Dear Sir/Ma'am
> >>>>> I have performed some tasks on Checkpatch.pl to find out the
> >> aggregate and summary of Errors and Warnings that have been generated on
> >> certain Linux Kernel Versions' commits . The summary of my tasks are as
> >> follows:
> >>>>> 1. Task1: Create a list of all non-merge commits that were added in
> >> the version v5.8 but were not there in v5.7. Run checkpatch.pl script on
> >> these commits and create a statistical summary of findings.
> >>>>> My findings:
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
> >>>>> My Scripts for this task:
> >> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
> >>>>> 2. Task2: Test what are errors and warnings by checkpatch.pl reports
> >> on v5.6..v5.8. Generate a report with respect to changes suggested by
> >> Dwaipayan Ray (
> >> https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/),
> >> to present the differences in a suitable aggregated form, to find out the
> >> kind of errors and warnings that are changing.
> >>>>> My Findings:
> >>>>> Change in the number of warnings and errors:
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> >>>>> Individual summary report generated by checkpatch.pl:
> >>>>> After the commit:
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
> >>>>> Before the commit:
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
> >>>>> Scripts used for this task:
> >> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
> >>>> Your email client is broken; you cannot send emails to a kernel
> >>>> mailing list with this email setup. I will not bother to use a proper
> >>>> email client either :)
> >>>>
> >>>> summary at
> >>>>
> >>>>
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
> >>>> looks good.
> >>>>
> >>>> Dwaipayan probably needs to look into the details here.
> >>>>
> >>>> E.g., why did those really unrelated issues change?
> >>>>
> >>>> AVOID_BUG 240 239
> >>>> TYPO_SPELLING 536 537
> >>> Ya, this shouldn't happen.
> >>>
> >>> I checked the reports, and the new warnings appear as expected.
> >>>
> >>> Could Aditya perhaps find out which errors in this case have changed?
> >>>
> >> Dwaipayan, you can ask Aditya directly :)
> >>
> >> Aditya, can you help us and tell us which AVOID_BUG remained the same,
> >> which appeared, and which disappeared?
> >>
> >> And the same for TYPO_SPELLING.
> >>
> >> Lukas
> >>

Aditya, your email client setup is still broken.

> Hi Sir,
> 
> I checked the warnings for AVOID_BUG and TYPO_SPELLING and I can confirm that they are occurring equally in both the cases(before and after the commit). The missed warning was just not in the expected format, in the report file.
> 
> For Eg. AVOID_BUG occurred as "cWARNING:AVOID_BUG: Avoid crash", but I was expecting the line to start with "WARNING:" or "ERROR:". This is why, this warning was not counted. Similar is the case for TYPO_SPELLING.
> 
> This probably happened because of multi-threading. To counter such occurrences, I have regenerated the summary report using regex. The summary can be found at the same url ie: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>
> Kindly let me know if you have any questions.
>

Can you apply Dwaipayan's fix patch and re-run your evaluation?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
