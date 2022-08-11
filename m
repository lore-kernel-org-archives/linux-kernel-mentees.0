Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E4C25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Aug 2022 01:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D2640C4A;
	Thu, 11 Aug 2022 01:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D2640C4A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ic+8ScIC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOGaicAm6i45; Thu, 11 Aug 2022 01:41:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1A33D40BC5;
	Thu, 11 Aug 2022 01:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A33D40BC5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEDF6C0033;
	Thu, 11 Aug 2022 01:41:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05664C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 01:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD7CB60F2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 01:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7CB60F2A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ic+8ScIC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCI7TDjRoYYG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 01:41:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F196360BA6
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F196360BA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 01:41:12 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 73so15880678pgb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 18:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=F6hxhK/CjlN1f5v5Y2g2kDzYo8Q8zwKdylN6nrbEMvU=;
 b=ic+8ScICKjjbdXIQQQmthij281I3mSRMks3Wz+5PmPGiGjve/0Mhj6uJHW1C1OjV49
 5dhtxWSiJpNuJ4+u/PT+J4y0S29qrn/kl6QgtlDQtaFaKNXFfotD9Y5odxIsOYNxDM5l
 J7R41PfhBLdPrayfFvDdBVB2MYqh8S4DudkAVWtJcxktwa8nBrRGTaxtOaLgXThhd/hV
 Fi3Ef7T557Gx2t5tXOK/JCsboXGvZOuhthyyJj0lUtoFz9uUHYAmV+HwtDZ1Bs36IA+C
 d4R6msDSug80BQWdnojMkESuKlA0YuJAsUSJEHSAKYUFcTLZ1xbmb9xE7YFBAvkN5+VW
 H3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=F6hxhK/CjlN1f5v5Y2g2kDzYo8Q8zwKdylN6nrbEMvU=;
 b=A2xKy8/9JdYu2ZkBPEy7AAgkStgwauio8WXcBNegRWwk7Z17ZCqmsf+HctPDx6EBXs
 eTeRmYIHWhhl8GXxNWlwTFJYSB460BBYArpbu/OeYOEFip1i1u4jHgqxCJWuUZZ1SKjy
 R+zjX+9HdAlMwjaXox7KWFmDhVK2ZxkmqBr+od23SSH2hFC7yHuDSemNexUhnHwiyVtJ
 GlwE7MjdQr5vcpt1OgqCotsbg6hEG/XPNSSNpSbO/q7wi+BWHh1Zs4QsmdfyG2KZLIn4
 I9AY7kDLPn6pykl58ZSS4IqzshJbT2TYc762xb+1E/IhXXIMJj//MI3oHvbECsipuvfg
 bZpw==
X-Gm-Message-State: ACgBeo25vcIua68I8oytSleIdI7WxF+d/j676kJ9rjNuMaiTP/VGuojx
 0B7C/63cajCWHXog5q2uxCA=
X-Google-Smtp-Source: AA6agR5i4m+EV/NKTsVlOHb/dJE8NZ1qD2gdYXDUfRbMq2kX6GDB3kvaCOXOJmrSZhtfLN6xJuAOeA==
X-Received: by 2002:a63:8ac3:0:b0:41b:ba48:e3f6 with SMTP id
 y186-20020a638ac3000000b0041bba48e3f6mr24089927pgd.567.1660182072334; 
 Wed, 10 Aug 2022 18:41:12 -0700 (PDT)
Received: from Laptop-X1 ([209.132.188.80]) by smtp.gmail.com with ESMTPSA id
 b17-20020a621b11000000b0052da33fe7d2sm2818830pfb.95.2022.08.10.18.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 18:41:11 -0700 (PDT)
Date: Thu, 11 Aug 2022 09:41:03 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] selftests:net:forwarding: Included install command
Message-ID: <YvReL0HkZt639BoO@Laptop-X1>
References: <20220810093508.33790-1-pthange19@gmail.com>
 <182872c2de1.4461d55242061.8862004854197621952@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182872c2de1.4461d55242061.8862004854197621952@siddh.me>
Cc: petrm <petrm@nvidia.com>, amcohen <amcohen@nvidia.com>,
 "vladimir.oltean" <vladimir.oltean@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 edumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
 "po-hsu.lin" <po-hsu.lin@canonical.com>,
 linux-kselftest <linux-kselftest@vger.kernel.org>, idosch <idosch@nvidia.com>,
 troglobit <troglobit@gmail.com>, kuba <kuba@kernel.org>,
 pabeni <pabeni@redhat.com>, shuah <shuah@kernel.org>,
 davem <davem@davemloft.net>, tobias <tobias@waldekranz.com>
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

On Wed, Aug 10, 2022 at 03:23:15PM +0530, Siddh Raman Pant wrote:
> On Wed, 10 Aug 2022 15:05:08 +0530  Piyush Thange <pthange19@gmail.com>  wrote:
> > If the execution is skipped due to "jq not installed" message then
> > the installation methods on different OS's have been provided with
> > this message.
> > 
> > Signed-off-by: Piyush Thange <pthange19@gmail.com>
> > ---
> >  tools/testing/selftests/net/forwarding/lib.sh | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
> > index 37ae49d47853..c4121856fe06 100755
> > --- a/tools/testing/selftests/net/forwarding/lib.sh
> > +++ b/tools/testing/selftests/net/forwarding/lib.sh
> > @@ -152,6 +152,14 @@ require_command()
> > 
> >  	if [[ ! -x "$(command -v "$cmd")" ]]; then
> >  		echo "SKIP: $cmd not installed"
> > +		if [[ $cmd == "jq" ]]; then
> > +			echo " Install on Debian based systems"
> > +			echo "	sudo apt -y install jq"
> > +			echo " Install on RHEL based systems"
> > +			echo "	sudo yum -y install jq"
> > +			echo " Install on Fedora based systems"
> > +			echo "	sudo dnf -y install jq"
> > +		fi
> >  		exit $ksft_skip
> >  	fi
> >  }
> > --
> > 2.37.1
> 
> This is very specific to `jq` command. What's special with `jq` and not
> others? If methods have to be shown, they should be shown for all the
> programs which are not installed.

Agree. The user could decide if jq should be install via REQUIRE_JQ. There are
also other cmds that vendor may not build by default. I didn't see any
selftests need to handle the installation. The users should takes care of it.

require_command() has takes care most of the needed cmds. If we want to
improve the user's experience for the needed cmds. I think add the needed cmds
to README file is better.

Thanks
Hangbin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
