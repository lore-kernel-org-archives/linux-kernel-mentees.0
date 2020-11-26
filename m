Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6968C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 07:21:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1268A2173E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 07:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiLhyZMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1268A2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8CF7B2E0EB;
	Thu, 26 Nov 2020 07:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnZLfdaGJuQI; Thu, 26 Nov 2020 07:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F81F2E0D6;
	Thu, 26 Nov 2020 07:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C3A8C0891;
	Thu, 26 Nov 2020 07:21:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59017C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3EFC4871C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOM04rg26STn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:21:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7CADC871C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:21:16 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z1so1221762ljn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMhUFAufP3YTPne/dh2VvAV4w9oIN+4ncrPoKPVqO24=;
 b=JiLhyZMFUuGhJoaX0u6ywY/iBPwVt/C48+70KJTjoy7goMjQ9Q6hs/5mDnhsDcHJBq
 rUbiDFesAm260EMuJ4VVVeLh3hs1POIiCtDtIgkuTStw7SHH5Jt1I711LeiK6npLWvIn
 KTIt58BNQbZev68PJPXRVZHebSsrQVnaCOsLLW1j1VF6mKo/msleigy/YBxZ4blT36b8
 rToXDalULzikef+snZxjWCSF6kEfisDUeJ4A+B9RS0RWB+doFmKjWvV68yNn8K4lh5RF
 HPOo8gAtGQsoC7AetpkvoRk8g7jbOokrblc5X1F5gfQ7Is56ulUd2amzDcF0bBweZ4Ho
 qDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMhUFAufP3YTPne/dh2VvAV4w9oIN+4ncrPoKPVqO24=;
 b=Y31H7J9l3bMJgAk8LYSfjHbPwryc+84TP1EJN8zeJKDQFGXIaoB69DnKIrSeRmI5pE
 gSFdA2fTptcgtRigMY1BHMnpln5rt/tg34mX/D1n+Jx7Efxp8wr5qpgILBf+IJ2eHt3v
 jZootrCI8GXYvAG+e/zSwwscQeZ9t/ChfaLZi+GEPDV+nh2JJ3zGyV1h5dhR2zs871k/
 i7I4rDqme+9EeE7c6zerZgpIsfLTvdz9c5THImFqJ1+2prs1I4XWq9P9LX1IujEan2y3
 yf/QdbxYztCMZAgBfGKXGRQo0OWuXWaaap/nWv46N8TNLKK6PAnyp1pZYQRAnXS7zMOn
 J60w==
X-Gm-Message-State: AOAM533dCc8HiUWesXuwMCjA4DZtjolJYJ+C7vyIPRomlDP6ard3Izpg
 /ZxsS7RJO+0lXd42yqeZg+KybQbXFFny3s27eQs=
X-Google-Smtp-Source: ABdhPJxokkVtFLHKmYXZySRfNl8cULG/Re6chfmsal2k4HL+C0tO6loQXpR1tF2owrJS28PvjqsS1xwp2tXIlUPuggU=
X-Received: by 2002:a05:651c:1206:: with SMTP id
 i6mr812163lja.269.1606375274523; 
 Wed, 25 Nov 2020 23:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20201125190444.167045-1-dwaipayanray1@gmail.com>
 <CAKXUXMzehKhxZwgUSUUuG8Ve-3FApGEnt9HUaqiZSHxN76rgFQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzehKhxZwgUSUUuG8Ve-3FApGEnt9HUaqiZSHxN76rgFQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 26 Nov 2020 12:50:45 +0530
Message-ID: <CABJPP5BQjz=FZ39KXFNi47RC6op46KeaWCAsXYmgJ47qDcuX5w@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
 unnecessary use of %h[xudi] and %hh[xudi]
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

On Thu, Nov 26, 2020 at 1:04 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Mi., 25. Nov. 2020 at 20:05, Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> Modifiers %h and %hh should never be used.
>>
>> Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
>> of unnecessary %h[xudi] and %hh[xudi]") specifies that:
>>
>> "Standard integer promotion is already done and %hx and %hhx is useless
>> so do not encourage the use of %hh[xudi] or %h[xudi]."
>>
>> "The "h" and "hh" things should never be used. The only reason for them
>> being used if you have an "int", but you want to print it out as a
>> "char" (and honestly, that is a really bad reason, you'd be better off
>> just using a proper cast to make the code more obvious)."
>>
>> Add a new check to emit a warning on finding an unneeded use of %h or
>> %hh modifier.
>
>
> Looks good. You might want to add the link to the original email discussion on lore.kernel.org in the commit message with Link:
>
> Lukas

Thanks, I will do that and send it off then.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
