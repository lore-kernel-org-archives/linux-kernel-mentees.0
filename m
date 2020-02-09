Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA76C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 09:44:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2955F20726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 09:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="DlZMVl5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2955F20726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BD3485567;
	Sun,  9 Feb 2020 09:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSvoI4t4mkiF; Sun,  9 Feb 2020 09:44:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A8B7854A0;
	Sun,  9 Feb 2020 09:44:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F247C07FE;
	Sun,  9 Feb 2020 09:44:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B8DC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 09:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A01687697
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 09:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6W2gFIdfGHwX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 09:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6A6E88762E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581241483;
 bh=qyjDJ3S9M5nUdwozC+Ah5wjiI8IWUSon/FIOptUxQz4=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=DlZMVl5BqBUyF+Qt8H9cyCeJWor2uTDfot6TZwf06xagLcLIh2HJnnJvalDGeUh81
 l0iH+yadie2XgjwhTUVemgOz2/tCJRGw+h1AJkfs9jRK+qnbEj0CasS8QoxJEgDNiT
 2CB+XAXWMM4vkZjVDzI/TZEmRPTVNa48ROHz5jrk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.72]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LgpIE-1jKx9J1274-00oFNM; Sun, 09
 Feb 2020 10:44:43 +0100
To: Julia Lawall <julia.lawall@inria.fr>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>
References: <08fbbc65-8aaa-e37c-7781-322df052bd9a@web.de>
 <alpine.DEB.2.21.2002091040220.3430@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a1ff532f-1f57-a07c-611c-8e469682ba2c@web.de>
Date: Sun, 9 Feb 2020 10:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2002091040220.3430@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:F7jW58Mwqa7vAEqCHelwoNM5UBcSfBbZLX95E/cd0ZNr+gxEmum
 ZbXcf8rM5AGj2VJFmcoAqwJuh9CIkPsNX6jEPhfZlGG8CohmdU3IOFb4YU8GvgPYVYcV+fC
 OyTmgE3QiOzLub1Ni6tVpqBCw4aQXp1smQCJEEhdE/OurDHdRClnu09ZzghQHJbaLwaY8LP
 N/O4z1FvjBAfaWfYf6zUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K2149hn2gMY=:GKuLKgG3UqDjhStsee6ngH
 ykH9Hp2z6lIlLoYrLVvJzqIqcPZhzg5BI4i0267aqrLCHxcUUukQ31aoDsT9HfnwpKYzo91jZ
 fbox1nPNVBZp/coRqNH/LO0rzEpV9/kRzY/kGdak9wVTiI9t1hIpmoYNdf3zA+jh9CdP2oIng
 yKaWIlIZ0SGedVK/MQvJQIt8FfXLlhoorVCb0IBXEinHRHgsNk0KpaUYQnbMysDy+hyQWCTXs
 Fq1Oi91r+THgWH7UVwo8ZxsC/ULLpy9ZC19K/vPsGwG/d1PyJta4zrTG7ZfypKmdj26tnWLXH
 GIBbXsAGXLI3qxZ1YFAAr1t40MoBqj9LfeYfWkWpKqRr9s0DEddkyvzvvGu+y/59mRdq1F88o
 7CTZLbtxNeSfvrgYygQHGgAOKPyvfW8Ng/ehw51x48PyQxni+BAEtAgm2lGB6xsJ2Rteer5d1
 oETtsIos0h7j0pj4wPCXoTBfjO1KbhY7paiyyU+aw7RJENG+M2WJ3gHCzvr4iOYBSHDwSvMqt
 ujA3MV0vS6OORWVrDjszJJN55EDfVfzcTlie9fMdN5sZOVy+wqrJv2/AoKA3kDbLzPv+/ZAIo
 79hsjUG6rmvrk0RXSoZw+We+ZJ7ixIIIg+0dPPFOAv898JDYwL5tKwd4JxfVV+WPPmrkjsFbo
 CbYAaiQdEcZGGb1fCKyQw9G2vXizmnCYUY2xJjcvJkuYI7BadAtfSJOuC75YZM3WKeoSxmPMD
 435/Fc+gQWNqCyBmgPKOvdqmfLa9muRps99vVk66gZxK7/QGuh6z1hnqdZvAUAtpaP98eniQr
 X/hmVjWyMwDXGVnlngjYHMj9nXId2Jv3YsYsCKKL+YmtKK0XinTkfXOxKMdEkCR8uulOgEiUj
 /yMR/GNXIwM5zb6UQw8pqSyj75UL8rCXCaT4uvgRS8E+cg5RyulIJYQ94xSe7RaYvVFJV5/17
 PMQp/VI5Xt1mdEhTUfmiImaIRcHNGJGki8MqdytR/KJmUxs5WGeeQSFMLOXVNcBT/kNSKWVep
 d8P7Zqs9oFMX0BLrL9bilnv9ZTHpYOr2J19Vs3EhF+rUlE95FNxq7JjjQqsyAD5UB9mCoo0RD
 fSVez0+WNkwR/G9fvEp5/333B/kvTOFRqRAsmcO+bGISj9tiphE/nlsWi26MW3k9zhsmASA/r
 OPZW7LjYqKCrBZYojMb4s378YYZRw0ztmiQWNZZkLhF2oFw19hY+dwkJCmGAdQqz/mbglwhn2
 jPPu9sqdM6v6dQSGs
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [Cocci] [v2 1/2] parsing_c: Align C AST
 and Coccinelle AST for pointers
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

>> https://en.wikipedia.org/wiki/AST
>
> Not necessary.  Anyone who is looking at the Coccinelle commits should
> know what an AST is.

I would appreciate to reduce the potential for confusion around
the application of parsing technologies.

Regards,
Markus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
