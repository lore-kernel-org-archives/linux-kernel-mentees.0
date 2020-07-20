Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E32C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 12:23:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B2C12080D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 12:23:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLvyiyck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B2C12080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A4B6872AA;
	Mon, 20 Jul 2020 12:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M9hRJWVEt90; Mon, 20 Jul 2020 12:23:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C4CD987221;
	Mon, 20 Jul 2020 12:23:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACAA6C0894;
	Mon, 20 Jul 2020 12:23:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31FB7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2DDF18723E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fz3LYwsyD6vB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE1578706B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:22:59 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x205so8350073vsc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8R4cXC26/KuqUKdcpf+pJ2nUEQ29VFMSyLtNBu1umPw=;
 b=SLvyiyckoFptwhf1lSobNDOXLPM9i4jADwSWZAKu11KsUVjzLa697I7iYe2AQVAx+U
 sDtJyHv+j7WsEmNTzJO5cTtWuuj5WGHg5VKBKfqLSpnBRvALbjN9y5yCGIX6X1hJ+6jg
 uA4AS4sTxKRSebL1u/H1ZOHOO5yaU1FB/OFPkI2W88BZqpZQtHJ9mOuEP9A7Br7ERhw7
 MkykGeczymEzb/M/u/mk5k+t+KPUyBENZUhPrTTAvG85tT1ZpjGyMkkd9rHhNx1iBeb8
 K29z+rGPoK87QRRxqQz4DJXE6iBIUlYn6Mo/mzOJXyrYM5ykpBVB50tsklVye+Av/E0o
 XBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8R4cXC26/KuqUKdcpf+pJ2nUEQ29VFMSyLtNBu1umPw=;
 b=I4PgvcYYjwe6CBz0YR3xD+0mlpj5HoGL52vz7KmqnWXl005LQ+l1v07h2iyd4jUuBK
 CGOSZQ9zOWpKUQbHUcXab3AXSYgR0GehmhTOHXgmZMNxs+VmeqjilHfgj1FSH0cHrUuh
 BLvE29zTIO5gs05SBf4OUeKMMQo89cwO4ZGtH8bqb/LUZSGiYKZ3foBZucx/HDhia8i5
 oH6sOlPGDbfSpz6GVegYSGEka/YL0Moh85JMcZbmJbm+hSssD2Qi3ZDEWNF/m9PvMJ9M
 ui5/xA3YUaIUXaaOTsHItFCKEs/oTLsuHHPoE8Q1iUlAuEDe1mmu9zWgm4HLMHi0F7D/
 2ojQ==
X-Gm-Message-State: AOAM530mk/mBsi6bPhIyX6pS8ZikUCUbXYp0UAiwlOXa5hSdoUHyXgn5
 B7J6GU/5HB8H6od5cLLupU1eoXS+StQQiwvkCDo=
X-Google-Smtp-Source: ABdhPJwEMDAf4Zd3VYdj5jebozmHAzWvugNprEGGU0nrPTXGdu5aUpxcKSp/5j53i9ISf1xxp/Q8Ugq/8xcym5igbck=
X-Received: by 2002:a67:ebd7:: with SMTP id y23mr5670633vso.228.1595247778909; 
 Mon, 20 Jul 2020 05:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <nachiketun8@gmail.com>
 <20200719171554.264462-1-nachiketun8@gmail.com>
 <CAKXUXMx3pkpY9Ud=VRf5EVVpr2ThvBTyF9Lr6Hw+CCRFvO7AbQ@mail.gmail.com>
In-Reply-To: <CAKXUXMx3pkpY9Ud=VRf5EVVpr2ThvBTyF9Lr6Hw+CCRFvO7AbQ@mail.gmail.com>
From: Nachiket N <nachiketun8@gmail.com>
Date: Mon, 20 Jul 2020 17:52:47 +0530
Message-ID: <CA+Dc07iQKrjZ7tPf1EpeT3c1w91aX1-tEbqzUX76Vh3X=1z9vA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Checkpatch: Disables commit
 length check/warning in commit log in case of valid signature tags
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
Content-Type: multipart/mixed; boundary="===============2572489376603165640=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2572489376603165640==
Content-Type: multipart/alternative; boundary="00000000000030d1cc05aade91dc"

--00000000000030d1cc05aade91dc
Content-Type: text/plain; charset="UTF-8"

I did run checkpatch on the patch in the previous mail.
Checkpatch.pl outputs warnings for commit description lines that exceed
beyond 75 chars. Sometimes these lines might contain signature tags that
cannot be
shortened. The patch checks if the line has any valid signature tags and
disables
the warning in such a case.
I tested it on patches which contain long commit log lines such as
Reported-and-tested-by:
syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com
in patch generated by commit ID ac854131d984.
It does not output commit warning for in such cases.

On Sun, Jul 19, 2020 at 11:07 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> Did you checkpatch this patch?
>
> You need to provide a rationale. Use a full checkpatch.pl evaluation data
> for showing the difference before and after applying the patch.
>
> Lukas
>
> On So., 19. Juli 2020 at 19:16, Nachiket Naganure <nachiketun8@gmail.com>
> wrote:
>
>> From: NachiketUN <nachiketun8@gmail.com>
>>
>> Signed-off-by: NachiketUN <nachiketun8@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 197436b20288..8db0f26601c5 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2799,7 +2799,7 @@ sub process {
>>
>>  # Check for line lengths > 75 in commit log, warn once
>>                 if ($in_commit_log && !$commit_log_long_line &&
>> -                   length($line) > 75 &&
>> +                   length($line) > 75 && $line !~ /$signature_tags/ &&
>>                     !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
>>                                         # file delta changes
>>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>> --
>> 2.25.1
>>
>>

--00000000000030d1cc05aade91dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I did run checkpatch on the patch in the previous mai=
l.</div><div>Checkpatch.pl outputs warnings for commit description lines th=
at exceed<br>beyond 75 chars. Sometimes these lines might contain signature=
 tags that cannot be<br>shortened. The patch checks if the line has any val=
id signature tags and disables<br>the warning in such a case.</div><div>I t=
ested it on patches which contain long commit log lines such as</div><div>R=
eported-and-tested-by: <a href=3D"mailto:syzbot%2Bdb339689b2101f6f6071@syzk=
aller.appspotmail.com" target=3D"_blank">syzbot+db339689b2101f6f6071@syzkal=
ler.appspotmail.com</a></div><div>in patch generated by commit ID ac854131d=
984.</div><div>It does not output commit warning for in such cases.</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sun, Jul 19, 2020 at 11:07 PM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bu=
lwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto">Did you chec=
kpatch this patch?</div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>You need to provide a rationale. Use a full <a href=3D"http://checkpatch.p=
l" target=3D"_blank">checkpatch.pl</a> evaluation data for showing the diff=
erence before and after applying the patch.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Lukas</div><div><br><div class=3D"gmail_quote"><div>On =
So., 19. Juli 2020 at 19:16, Nachiket Naganure &lt;<a href=3D"mailto:nachik=
etun8@gmail.com" target=3D"_blank">nachiketun8@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: NachiketUN &l=
t;<a href=3D"mailto:nachiketun8@gmail.com" target=3D"_blank">nachiketun8@gm=
ail.com</a>&gt;<br>
<br>
Signed-off-by: NachiketUN &lt;<a href=3D"mailto:nachiketun8@gmail.com" targ=
et=3D"_blank">nachiketun8@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 197436b20288..8db0f26601c5 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2799,7 +2799,7 @@ sub process {<br>
<br>
=C2=A0# Check for line lengths &gt; 75 in commit log, warn once<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($in_commit_log =
&amp;&amp; !$commit_log_long_line &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp; $line !~ /$signature_tags/ &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !($li=
ne =3D~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file d=
elta changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $line =3D~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>
</blockquote></div>

--00000000000030d1cc05aade91dc--

--===============2572489376603165640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2572489376603165640==--
