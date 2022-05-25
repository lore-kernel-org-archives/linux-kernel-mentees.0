Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC9C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 00:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DE883FC2;
	Wed, 25 May 2022 00:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bz1yAjsxU182; Wed, 25 May 2022 00:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 742D783E95;
	Wed, 25 May 2022 00:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DBAC0032;
	Wed, 25 May 2022 00:42:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CC61C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B20B83EBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QnF_F6vdEFI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:42:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41FCD83E95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 00:42:40 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 2so10153075iou.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/vA5r8vB9NIZuGH+3Gn4tx8CmzZqeLKwScmkVCbeQk=;
 b=n2L99c5Shgph/DR4WjewPD48c09R9zz3I8cw0ztfDD3Qh3KdpF2X3OZ38KlVnxSUAN
 kpo/2TMLVAzYEXW0k6vU8Cfg6ZwGyVajhQCC89eqssVL9jT/7B/wKVFwpopOKd9n1vge
 U5lj/KVZ/aJgAEfSNDdQySzim8oMeEkI9oeeNDHlt05gK3ndEgO3j4EYcx1I/PUeV/0v
 /0haj6FterVuqzvw7uRaX90uJjGIFXYjY6w+ax9HYSzt9Bc9yXVThVUUonujD6vnekxK
 FW3OZQzIYRdJvSjYdRa8YR1JsceQj+ppA5OVBEDOsta0rZPzPwGcRLkSRMZPs9ial9Sh
 3SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/vA5r8vB9NIZuGH+3Gn4tx8CmzZqeLKwScmkVCbeQk=;
 b=3ibgSVEGVz+nFcproUqqAKX/Fdp5Sp5uIXIcikVvC57ihn4G7HZwdPBmxGiLV8lBNW
 WYkqKzSBOR1LM/s5c/5c2Dql2QhhrIYM1uJ0w5f7agZfrRcmSa0uuXg2e1wlb+XrbGz/
 +Ct58OjR7ugk/My/KYuM4Ah9N4VlHkn1rPpH5mXOR5fdRgpUsHZXSASRSIi9J2wUZOde
 RohFo3gI1kX/5jWtnApCkamYNOQPGYae8Hnlxpo68B7emWwzTUU2L1liCSGVohRM8yfN
 YDOMm1+NytA6YukSQiq7KrvCgicqNzvSH+fYAFBDVb940rbxMxpCVbKUxEDVQHQLjKdJ
 6syg==
X-Gm-Message-State: AOAM533PaoGNTasTVP4rHZ1++afbPQtWv6EqoE0VlenR5SormhLY83y1
 ms8G+VdtELJgi6YZzKy+JVzvHqfOdFQ9iJOao9g=
X-Google-Smtp-Source: ABdhPJzHA9OmUKmEMxk3iOzuQs9Yj/N8YCthYnmMrHZK4bJTZB35BW1J5JCBoPuJtgua05+Ixu/Zamn5iVZuj8b+sxA=
X-Received: by 2002:a05:6602:1801:b0:662:37bb:c722 with SMTP id
 t1-20020a056602180100b0066237bbc722mr6750290ioh.202.1653439359362; Tue, 24
 May 2022 17:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220523165802.500642349@linuxfoundation.org>
In-Reply-To: <20220523165802.500642349@linuxfoundation.org>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Wed, 25 May 2022 06:42:29 +0600
Message-ID: <CAABMjtGTdZAAwr8Kxy1fxXJdYo1WuoiwE_MrSbdimNaQEcxCRA@mail.gmail.com>
Subject: Re: [PATCH 5.4 00/68] 5.4.196-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: f.fainelli@gmail.com, torvalds@linux-foundation.org, slade@sladewatkins.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, akpm@linux-foundation.org,
 jonathanh@nvidia.com, shuah@kernel.org, sudipm.mukherjee@gmail.com,
 linux@roeck-us.net
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

On Mon, May 23, 2022 at 11:08 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.196 release.
> There are 68 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 May 2022 16:56:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.196-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Compiled and booted on my arch x86_64 system. No dmesg regressions.

Tested-by: Khalid Masum<khalid.masum.92 at gmail.com>

thanks,
-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
