Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D21C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 13:42:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6882075E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 13:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWCYI+vo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6882075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5FED871F2;
	Thu, 17 Sep 2020 13:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04004GQYJESP; Thu, 17 Sep 2020 13:42:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB2EE878D4;
	Thu, 17 Sep 2020 13:42:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 884CBC0888;
	Thu, 17 Sep 2020 13:42:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFD48C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C491878C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6zsdsNSOL74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:42:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE9F4871C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:42:02 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id o8so1922837otl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eIJC8y+Y9116IK0liA56qKil/4sZxMNPTf/NOF5Yj84=;
 b=LWCYI+voc6lHHoVKN1Up7irvdaknArmGStrOU3jGnmvOSILn5HawAkYM1WFOTq+Cng
 6XlmDzyaKwI+9b9bOSp10wcsvoCLseV/DxDo9JUMPBJCygqzj6ppire6DrBoFnXD9XAJ
 EWhqUmFUpcytro+2F+1mj/ojF6+7bFLD1zVVEse0jrhzuBm7P6zCEM3GqYUZ/VMVwCnm
 bRlGmDkkSU6UBta4hZ7PWUjrGTi5nlmRuqHYaKmINl9T1mXla24lcv8hcsAAKfXLMJql
 oPEWOx9YXdaTbasmzGK/+CmpaqjB/2MzZlLi1qsF7aoYPRTPPgbD8kZcOCU6MnttjlE1
 +CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eIJC8y+Y9116IK0liA56qKil/4sZxMNPTf/NOF5Yj84=;
 b=WiU77SBly7AP2fJQfzEG1CP4GPP+43+FdKfpCSVshZo5XeNqbzh2QH65xTZEnaCWDy
 F5sdH/neBcyKeMOyg6vL9D5bMLVWp9mtFwyMdMK1z18Z+wVPGg36FXVxNeBmiOqVB+no
 jTmpKG9cfhSLvCzIgFNPjJ75UdFlDHcLe1z3LBWWDYUsLzMS591EKdseBm7VJ0RO0mn8
 gQI9eS683UkoFgC5Sw6mlxe6q6hxdF6FY9PKi2otjg+xtypBMWBWDD6N/SICwQbTR/N+
 yKBMywtBOCEk5y7StHJdM6Az9yF8cKtFROG8UbTRfpAeG7DWB/d4hXLrppRPUSbdg0fm
 a31w==
X-Gm-Message-State: AOAM531NtgjLg/EFud0vQYfzlSeq9YYpXQmOGc8gU2FYWz49c6kOZpyP
 pptLMZQ4j00pPmDOb0TpYioeuqIs2wXbr6d6Dp4=
X-Google-Smtp-Source: ABdhPJw42EJ49oRSRziONrojgPFVfchv0cKeNFQHu9AW+InK8L1YWZ2AaboV++J7d//BmIbXrBWByojh3PsQ91J40gE=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr19059596otf.265.1600350121785; 
 Thu, 17 Sep 2020 06:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
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
In-Reply-To: <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 17 Sep 2020 19:11:44 +0530
Message-ID: <CABJPP5BBUsSQBDi1QbL7xgVdRUqMG7OWXcNSUKsMN601Y3EYbw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

> So you see in all these cases non ascii characters are present. I looked
> into checkpatch.pl .
>
> line 2662:
>         if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>            $author = $1;
>             $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>             $author =~ s/"//g;
>             $author = reformat_email($author);
>         }
>
> When i looked into $line, it gave below:
> From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie
> =29?=
> <zhouyanjie@wanyeetech.com>
>
> And at the end of this block, $author was equal to ''.
> There seems to be a parsing problem there.

Also I looked into this output more, and I looked into the git
history. For the FROM:
parsing part, the author wrote this:

"Non-ASCII quoted printable encoding in From: headers and (lack of) double
quotes are handled.  Split From: headers are not fully handled: only the
the first part is compared."

So the problem instead seems to be the Split From: headers. In all the
cases that I
mentioned, due to formatting issues or something, the email address was
pushed off into the next line, due to which parsing fails.

A solution would be to write logic for handling these Split From:
headers, which the
author left off.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
