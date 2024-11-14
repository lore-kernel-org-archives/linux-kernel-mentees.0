Received: from sonic308-15.consmr.mail.ne1.yahoo.com (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7C6757EA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Nov 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731603925; cv=none; b=fHHdMPUMInZ1alxvw5AL+Lb/gMlOl/ylCxQ9yhDVh3SmclT98ylZ/kN2bTyyQNARpYml93RwX+YBjzrSwwdS6JM5BqqDD/LWdnrjNBfrp4cWjFqnT/fjEsp0nJ7NOXI8UTLm9WohJiuQyBkQ1396rUeaVR1pzTEmln0jPoOj5nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731603925; c=relaxed/simple;
	bh=225Xg3lGtzU2suqnuMm7mLYtTLLYNlKBn9V7o6ahfHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8dRCyayw4NXAZ1VkulBc8Wha1x1eyOlmZZ5UiluJvJ4IwzXkvcMf0ruHH/qOuTcyWF3YWmYtP+n3P7PTj4Hpg6GqwnzmKHvG/gyQF+DInMUa2sWfgq9NNGWsv4ilnnheddmcLN/FamI5RF+oB68gbrJ7Ziht20oFTPTOycybzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=BcqPXj06; arc=none smtp.client-ip=66.163.187.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="BcqPXj06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731603922; bh=225Xg3lGtzU2suqnuMm7mLYtTLLYNlKBn9V7o6ahfHY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=BcqPXj06B1y28vUv7pgDxXxNkz7G0QSweFLqHmF6ul1AxtxVQ2QJcAABrQyGb64V7fROnbCv495aTi302d/CznKXyWaWliqxz0717Yg4eTLSPRUVnJj0NfOZ+3LgjFijKAFtR4SIkJsVC2usqVkRWR0qZ7/dq7c5ToRZp6CO3b9Aij2SR5OfdcAlaQ5tdWnRM+7qoK7WVa2muyzwOPBZsx2V4bTzeWjf+jCPMouIKHeAWE15kgjZQ3eXEU2VK9vZ9/dH/UCGs5yXc4x5bp2rTGPkSxYYls4s0SDc7TtlPS4/zf7EgUcKHSYNGBN62BiIzI5ldtvAqzaSjamHmtFIZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731603922; bh=2RfP+beC+ci5rr18o29Um5wygRt2fLH8RG3kzBs0CKD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=N39DEdK9l8rJwU0F8bg7ZYHGDyDGChGjDsYzGCrYaW1drNj/uFOjt5dHrC5nQdiZ3xtPeu6StTJ2LXxNUv0lqSWJi3YMlbyoATCAzCBtQvAKfyJPa19E5uGI47VyH3lUe22+I2f9c2hWOW3/kyTiLP/B1mwg2k0gni3aqR+c/DHIxEk45a4Bi3Wz9gVCKk5xvquFhL9rJZvjHj+Udh/xXpnylZMeBDRR6AZbJJd4dUYum+hNdbSMH8mp9LhMfBwv0zNKuXlaAUTAfUD3ZyTC3kPfLo50MBGO872PP5GaEktOl4uZ7H2f1P7B654GlEUQImZpGGWmt7Oj1vA7eWardg==
X-YMail-OSG: F_SLC2sVM1mL8EeQF2d1knzo_cGXLETriYy.ZIgaCj.i4h2Fc..ajxb8d81yZt5
 ohHogactWDk0NJ6sMVmlgvRhq6Nnt.H_gUiqOF_ga2Gm.gPjk0BXZTV.LFRGF8K0NdrPvpadV8LP
 RvHjE3c7AM3COGDw._RmZj6YtiXZvxXsUfF3gJeU2vHx0uvAytZAdCdHEWaDeeCerosUgA0u.M9t
 D7jLRPeNYTAouzOM7hhHA0pmGAGqIVSisjjjhM1_41srcy84KFIiKzYsFcK1BYyYzLf7GpbkPWTk
 zhxgpkyIHtG9nCQm_knKdbXNNmEuTikTz02vtZpSk_BRghC2b.6e4QDxRbQBKM51JBM8MzDaGWG3
 MJeEzO7lgDfrcgXJD1AU2fiPnkG4smwMtEC13PH2Rz2ZVNtv6hPjF2LKTmiaKO0Qh_nu9FPHH95o
 MCLkv1gxyHVKJ1cfENcZ6dABrpZdrHpG8RO9ZPM2.mfftTNCdqC4LiNavrLm7zPV7.faheXnsCQW
 pXgY7dLpbesNrpreD4ekHZJaEmi8K1aqsMeCxcrJwdLxhObvqLvgtRDxmJtQZnnc9nYefistTpG6
 i.NN49pRZNaoNa0FT8fVGErJtn_4DSa.aUXAuSOIZZ4KDtj0Opm2rNZt2ga8Ub.sXUZhwVdDB_C5
 tOu38aNfTSsitIgVRaLvBFwxF.Fl8IcyZZa692AIylgTJaSIXRD7DMEJgzU1e3rtTkZ9jQhoaa4M
 jnP68V.iNEgkPhlkBj7MkpLRdxrl7C1J5SQ6gy7FEVrQZgyMagMoKudLj9ppctdXkoRPd6LZnqGZ
 LCNZA.l53tOlu.6zfZNkUKrMPiHYNk8CfjvUCkLu8s8YYBN9Vk6EgCxCi4EYIzldRQYWzV7Ui7c.
 cYJfb4QOgdRGeF1rTs52PCuqm86f0.UYBM_nXqMLsmGC5jtGxK8EpS4LZjD0HQQhegJrpjbAkR4A
 6sI3hKm.7I2wHQ.3nRfOX1QGDFLQDd3l7LuptR90n7DN8c91BqNqPnSub7YeboYFS3e5VkaTK6oP
 DpRE8CG3vBpyImW35lmCirjeXUFXALovT9E3nUcg7quN440G_pc3.XZZDiDPFs7_UmtefjBGlj10
 sZa9CPQCFO0wHVvofP0HpfMG3cid1BhAcKMEN55ZeFUA_gdj8nJcvsKY.gpC0aydlCnwBH8j2yck
 2BnfZsqfu5CrTIf1.YM03MsC7.QVtXtPhRKRef5TI3OnGtqwFJvnm2u0nzuRRXcSTksD6BL9iU9D
 EUjAxEDo3hyD6LUBw2gynhAKhXX7pVN1k5xV9.Zr8cekcNVHEWM9D0KqXaSe04FTIW1nK2C6BfTf
 jCFNbQCb9VySqRqTQuJMygVu6CozU3PctL1Gfu_6xcu8Nr1pAe9wKeZI.6DlxJk1g9fYiwafon2n
 5zB4tGkB10aYGJ0TywzminM7qTVgtpbM15exNXSvXf_NIRstXpeaO8Gih0GoZevCmDJq1nZr_VR2
 43pZe69p8WW0Zf9OMVpMYG67QaT84c9nPeDVkBeJl20dme1nUNM7MDosoh2kA.Rjm9fKA6vQsLs4
 nVgap7p8jlWR5RzRoXC7NfgHLpyg8lOIF8NQl9u6g2cXqMiR74SzosU1uKoLPx4S7umOqt1joRF.
 YdChiQHNfrbSqkQTyACEzL3UIQ9MtR1qBcJMFa.XIJinpZUTJp8LwaIh5_1_6lLiZJCUxp_g5RHP
 XYPdUr3lZ5SrK.fR7.fpB1HUbQXnY7pEPixduS0ZJdqWuq0O3g57CnN0BIMSXfUw4qW2wU5JIMVp
 2JhUfrN6i1eUAlweQ9TOxKdqrXzCjyJGHT_suK.fnhnzKPrhKXRy_aykDvcC8WQCvR2ifwy0Te9B
 hBzXPDmrIx6HWArhWAZYSmDA2e.0wJdwn1mJdVZ8p_zK8yWqQNIDoQoE64gWQ_sXvjlfiEJhxsna
 f9IGn1izZP6vXTli0AGKAjYcPz1B23SK7sryUa4ixp.A7ogyEn.CadaBAV3iwml6OlQPMuYlWvjb
 i99vOPO.zLJrG2QW5xYCRdYavNTratonmPINnoGKa52nI7_EXy7Q.k2jjeSmIGcTjKzRFQKqhEwB
 lYw_p7wg7yVjJ53VI4DPVd3QBvqEcgNhTgyWBuQoizOQJ1GtlHKZpuMJmum2vkhTGGsY.DCDuFVo
 KpdBOt7yUS6c9UoDoHROt1ocweYcmoV_U9YGWiTcceNbVKSENmWvBPrG4NENvEoDaP7beXRhl6DU
 EJTdeKicNyLDQ59TF6tyq3f0yhkASC8P_kJ9r9FlZUmtqYw--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: dc530b32-4640-4104-a80a-76b3cc4eac0a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Thu, 14 Nov 2024 17:05:22 +0000
Received: by hermes--production-gq1-5dd4b47f46-mb2l9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 62a3195ceac711131de6021a88b7222d;
          Thu, 14 Nov 2024 16:55:09 +0000 (UTC)
Message-ID: <c16b7517-e490-48d9-a2b6-f0077cbb0eba@schaufler-ca.com>
Date: Thu, 14 Nov 2024 08:55:08 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: lsm: Refactor
 `flags_overset_lsm_set_self_attr` test
To: Shuah Khan <skhan@linuxfoundation.org>,
 Amit Vadhavana <av2082000@gmail.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, shuah@kernel.org
Cc: ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
References: <20241112182810.24761-1-av2082000@gmail.com>
 <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22876 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo


On 11/14/2024 8:25 AM, Shuah Khan wrote:
> On 11/12/24 11:28, Amit Vadhavana wrote:
>> - Remove unnecessary `tctx` variable, use `ctx` directly.
>> - Simplified code with no functional changes.
>>
>
> I would rephrase the short to simply say Remove unused variable,
> as refactor implies more extensive changes than what this patch
> is actually doing.
>
> Please write complete sentences instead of bullet points in the
> change log.
>
> How did you find this problem? Do include the details on how
> in the change log.
>
>> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
>> ---
>>   tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>> b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>> index 66dec47e3ca3..732e89fe99c0 100644
>> --- a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>> +++ b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>> @@ -56,16 +56,15 @@ TEST(flags_zero_lsm_set_self_attr)
>>   TEST(flags_overset_lsm_set_self_attr)
>>   {
>>       const long page_size = sysconf(_SC_PAGESIZE);
>> -    char *ctx = calloc(page_size, 1);
>> +    struct lsm_ctx *ctx = calloc(page_size, 1);
>
> Why not name this tctx and avoid changes to the ASSERT_EQs
> below?

In the realm of linux security modules ctx is short for "context".
I used tctx here because I was lazy. It would be much better to
drop tctx, even if it means a tiny bit more change.

>
>>       __u32 size = page_size;
>> -    struct lsm_ctx *tctx = (struct lsm_ctx *)ctx;
>>         ASSERT_NE(NULL, ctx);
>>       if (attr_lsm_count()) {
>> -        ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, tctx, &size,
>> +        ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, ctx, &size,
>>                              0));
>>       }
>> -    ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT |
>> LSM_ATTR_PREV, tctx,
>> +    ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT |
>> LSM_ATTR_PREV, ctx,
>>                       size, 0));
>>         free(ctx);
>
> You have to change this tctx for sure.
>
> With these changes:
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> Paul, James,
>
> Please do let me know if you would me to take this through
> kselftest tree.
>
> thanks,
> -- Shuah
>
>
