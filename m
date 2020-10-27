Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89719C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 09:51:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED74D223AB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diOP6Ayv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED74D223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F68A8577A;
	Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENj4MxEDot7k; Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C837D8562D;
	Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC290C0859;
	Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECBC7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1FDB8665B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRmHBwb6K783
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2890A865C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z23so677718oic.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xOfmtnGxftU2PU1FJGrp8A190ENwyVCv7XH9avGJemg=;
 b=diOP6Ayv0gtPfZ5QdWR7iSXe3lcsTILpeEqUt8H94BGxJxua0EUBlZlBkyJzU3OFOs
 x6D9yg8VoH54yI2CCcOY6rDCsd//r5WfF0GhB2bpOT5e5o3kCnZD7mWFm9KnLhG7oFvB
 34UFyG4Bs7k5dz0hfHVjpCIKFg4U3DKnUggBbn4ofvWyf/ZIMYjlJC3icCJSybCluPOc
 bwzyikHiNfCAYvdbgwWde7OsN0G6b721DrlEUMiN7S4I4XLpkpjUGLIy3/NtMmeUToAu
 NgQ6w6QCatr2RJcdPckgsZfalaTgKx+LrXzkINe2fiYl+ySDzhutcqDvlCHuE+ymkdwQ
 HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOfmtnGxftU2PU1FJGrp8A190ENwyVCv7XH9avGJemg=;
 b=P0/oHA81YzQA4v3XKCZl7R77sqpJUAHnS747bEHlHHuqHsno38SJuBfIj2HRvSPw5Y
 PeLT7/TkEStJKrnS/6OUfw8hprJLOEuhoqpIUyqzfZO8FNbOyaf3FRwAHn3ZWhuiH67g
 K1AxxZQVMICNvOLE+JQKCk6SiyhpqzurR8P9E2mRu1FCCY8ragEXstOPBSs1rBtJxPvQ
 bxbAwIg9bvALm4d3ZY1DrOXFoNyuisb+JFU5UGrfqqLiISLt+ouxSLUGqfx1C6q5KBDQ
 fmndUmKPB3bhh3c0blXRyRNqH6dXwXcTOf18dItg+z0GpzJkUWam28rXmQTk4xF9QDlg
 Xcpg==
X-Gm-Message-State: AOAM531Y+adpRAR1NAp67/UD8dYsHjLn7fViH0LxfQNbPhtOuypINuSU
 dCvkUttnqDdkWBghlA5KzVprEqACwIi7cN1m5/c=
X-Google-Smtp-Source: ABdhPJyv+BWQf4aqLE7vMZNdXWUecghdv8wALhTPdx4Mkm33XebMWcLwGHEwXKhlGgLR3OOqZcSFUyKg0uLkE4IBp0U=
X-Received: by 2002:aca:d5d2:: with SMTP id m201mr849453oig.74.1603792300256; 
 Tue, 27 Oct 2020 02:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2010270918030.7937@felia>
In-Reply-To: <alpine.DEB.2.21.2010270918030.7937@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 27 Oct 2020 15:21:11 +0530
Message-ID: <CABJPP5DfCpCA3eD48WPU0H11gRTEN6eZzJvk7LEPVnPUj0M=Lg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Current state of your checkpatch.pl work
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

On Tue, Oct 27, 2020 at 1:58 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Hi Dwaipayan,
>
> can you quickly update your Google Doc with the current state of
> patches/features that you are currently working on, that are done, and
> that we decided not to work on?
>
> Just to make sure that in case Aditya wants to start working on something,
> we do not coincidently work there on the same and duplicate the efforts.
>
>
> Thanks,
>
> Lukas

Hi,
I have updated the docs with the data - current status, solved ones and
things which need to be done and things which should not be done.

The link is:
https://docs.google.com/document/d/1kO6Bq27OFHgQaQYKIfSLh-0tfO_7gQIe6CdrVxY6AMQ/edit?usp=sharing

Please let me know if you can access it and if I should add anything
more to it for clarity.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
