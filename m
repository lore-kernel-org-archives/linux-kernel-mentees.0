Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64939C7112B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Aug 2023 06:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D191683C66;
	Fri, 18 Aug 2023 06:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D191683C66
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AnTsUWWu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIIJDE6pP1tf; Fri, 18 Aug 2023 06:34:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DAF4583955;
	Fri, 18 Aug 2023 06:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF4583955
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF043C0039;
	Fri, 18 Aug 2023 06:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95C41C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 06:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D9F42214
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 06:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D9F42214
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AnTsUWWu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sO3zV3BbWdgH
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 06:34:23 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DDA642212
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 06:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DDA642212
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a76cbd4bbfso372179b6e.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 23:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692340462; x=1692945262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38rkmW3TQIcTdI5/jSxJ3xKQMGKCkoLsED1vztdBOnM=;
 b=AnTsUWWukNzb3xYXmf+gmyJyLu4ZZCalKfIyBogLJU/Isx8TCUcZmW0wFyiIJwQogi
 jgfzh2RYWzqQLUbS5Ucuy5s368DaAisJnt2foUlpHNP5DTAu9eN9hvsXt1urqaHSd01i
 gOwGt/UJDE7sMqXMp58OyZJ5WyX3dLwZsEViq1pJnr8dhzXeT9+zxKs167mmnEJLkLH3
 Z0dJus+rSAcZFhzyJ4GLICH4qbFsLrOlGluMcBcMn5n/qiwHCEn/X2F9puytwVJFvjS6
 RcGz9kCAD5dh/3JEj7YWvsfJ1zNlsHmRJbI2Y0HmiFezXxOmKiSYuY0pg/m3AwB0OQFg
 /hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692340462; x=1692945262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38rkmW3TQIcTdI5/jSxJ3xKQMGKCkoLsED1vztdBOnM=;
 b=ciJ7IXUs1HRcC4+9cLHoKJphx2S8QSBWPMhHH7XI86qNbxh+OtfRsx5N56xr5Rv12o
 EKWIJOa3n7cjnGAkoKCCPnfdgJeYX775Gpx5Ka3eQz+S+KyBeYib/jXVq5HmglHMc5FR
 ceuREk5dSMD1U+A6yEFluOS/QE2Ofka1QLQF1Ps5r2Q8Ef06RtuM497zr1xW3+aUEg27
 FDNBEVcl/0VU9JDbQHk+Ol6DowocO30t8X+zHrpeUL2X2Ma8LTJYEqyJjnIaJ2VXMSnz
 lJx1wUCWG2vM+eYcMKzz9XFoaiAO/jPXgu0oAlzhZ75sbnmBq8z9QRdDcKS0Is/UBUiB
 t3kQ==
X-Gm-Message-State: AOJu0YybwPm3dpWOgK69NXj1T/0Tz6P3bKpW0NH3Z/O2J0n1Dd1Be+aw
 NaKTDdDRVtdCWKjwuQlLhfA=
X-Google-Smtp-Source: AGHT+IFOx3J6HEKmKWHIbx8sxYyeFqTa65nccBi7EkFrszyIBIdZY5gBZ+nNiTyHNkQtpZj9LQlHkg==
X-Received: by 2002:a05:6808:1887:b0:3a7:30ad:df28 with SMTP id
 bi7-20020a056808188700b003a730addf28mr2214541oib.37.1692340462085; 
 Thu, 17 Aug 2023 23:34:22 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.174]) by smtp.gmail.com with ESMTPSA id
 k125-20020a636f83000000b005641bbe783bsm726348pgc.11.2023.08.17.23.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 23:34:21 -0700 (PDT)
Message-ID: <54a8ae10-71f4-9e91-d2b7-bd4a30a8ac2a@gmail.com>
Date: Fri, 18 Aug 2023 12:04:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230813055948.12513-1-ghandatmanas@gmail.com>
 <2023081621-mosaic-untwist-a786@gregkh>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <2023081621-mosaic-untwist-a786@gregkh>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Sorry for the last reply Greg. The last tag specifies the commit id. 
Also, I have sent the v5 of the patch in which I have made some critical 
changes. Please take a look at that.

On 17/08/23 00:45, Greg KH wrote:
> On Sun, Aug 13, 2023 at 11:29:49AM +0530, Manas Ghandat wrote:
>> Currently there is not check for ni->itype.compressed.block_size when
>> a->data.non_resident.compression_unit is present and NInoSparse(ni) is
>> true. Added the required check to calculation of block size.
>>
>> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
>> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
>> Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b
> What is this last tag for?  That's a kernel release version, what can be
> done with that?
>
> confused,
>
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
